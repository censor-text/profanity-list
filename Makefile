sort: file = $(filter-out $@,$(MAKECMDGOALS))
sort:
	./utils/sort.sh $(file)