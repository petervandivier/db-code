
CREATE TABLE pgbench_tellers (
	tid INTEGER NOT NULL, 
	bid INTEGER, 
	tbalance INTEGER, 
	filler CHAR(84), 
	CONSTRAINT pgbench_tellers_pkey PRIMARY KEY (tid)
)

;

