all: matrix.pdf

clean:
	rm -f *.pdf *.tsv


hyper.tsv : roundingdiff.py systems_results/hyper/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_last systems_results/hyper/answer_sets > hyper.tsv

monetdb.tsv : roundingdiff.py systems_results/monetdb/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_first systems_results/monetdb/answer_sets > monetdb.tsv

oracle.tsv : roundingdiff.py systems_results/oracle/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_first systems_results/oracle/answer_sets > oracle.tsv

postgres.tsv : roundingdiff.py systems_results/postgres/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_last systems_results/postgres/answer_sets > postgres.tsv

sqlite.tsv : roundingdiff.py systems_results/sqlite/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_first systems_results/sqlite/answer_sets > sqlite.tsv

sqlserver.tsv : roundingdiff.py systems_results/sqlserver/answer_sets/*.ans
	./roundingdiff.py answer_sets_nulls_first systems_results/sqlserver/answer_sets > sqlserver.tsv

matrix.pdf : plot-matrix.R hyper.tsv monetdb.tsv oracle.tsv postgres.tsv sqlite.tsv sqlserver.tsv 
	R -f plot-matrix.R 
