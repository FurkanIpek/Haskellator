files = Main.hs Types/*.hs Utils/*.hs
flags =
compilable = Main.hs
obj   = haskellator

$(obj): $(files)
	ghc $(compilable) -o $(obj)
	make clean

clean:
	rm -rf **/*.hi **/*.o *.hi *.o