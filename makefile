generate:
	make --ignore-errors clean
	python3 src/generator.py
clean:
	rm src/generated.sql
