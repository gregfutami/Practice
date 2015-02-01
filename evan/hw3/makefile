#not working mostly a place to copy/paste g++ commands
vgraphlib.h
vgraphlib.cpp
vintage.cpp

g++ main.cpp hello.cpp factorial.cpp -o hello

g++ src/vintage.cpp src/vgraphlib.cpp -o vintage

all: vintage

hello: main.o factorial.o hello.o
	g++ main.o factorial.o hello.o -o hello

main.o: main.cpp
	g++ -c main.cpp

factorial.o: factorial.cpp
	g++ -c factorial.cpp

hello.o: hello.cpp
	g++ -c hello.cpp

clean:
	rm -rf *o hello