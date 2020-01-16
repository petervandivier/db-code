
CREATE TABLE pgbench_accounts (
	aid INTEGER NOT NULL, 
	bid INTEGER, 
	abalance INTEGER, 
	filler CHAR(84), 
	CONSTRAINT pgbench_accounts_pkey PRIMARY KEY (aid)
)

;

