#!/usr/bin/env pwsh

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true, Position=0)]
    [Alias('d','dbname')]
    $Database,
    
    [switch]
    $AllowClobber
)

Push-Location "$PSScriptRoot/$database"

$order = Import-Csv './order.txt' | ForEach-Object {                   
    [pscustomobject]@{                                  
        table = $_.name
        order = Invoke-Expression $_.order
        tbl_file_exists = Test-Path "./tables/$($_.name).sql"
        data_file_exists = Test-Path "./data/$($_.name).sql"
    }
}

$db_exists = psql -t -c "select datname from pg_database where datname='$database'"

if(-not $db_exists){
    Write-Verbose "Creating database '$database'"
    createdb $database
}elseif ($AllowClobber) {
    psql $database -c "select pg_terminate_backend(pid) from pg_stat_activity where datname = '$database';" 
    dropdb $database
    createdb $database
}

$order | Sort-Object -Property order | ForEach-Object {
    if($_.tbl_file_exists){
        Write-Verbose "Creating table '$($_.table)'"
        psql --dbname=$database --file "./tables/$($_.table).sql"
    }
}

$order | Sort-Object -Property order | ForEach-Object {
    if($_.data_file_exists){
        Write-Verbose "Inserting records for '$($_.table)'"
        psql --dbname=$database --file "./data/$($_.table).sql"
    }
}

Pop-Location
