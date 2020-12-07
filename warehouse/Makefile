run:
	mix phx.server
run-interactive:
	iex -S mix phx.server
create-migrations:
	mix phx.gen.schema Handbook handbooks type:string article:string mark:string price:integer gender:string; \
	mix phx.gen.schema Colour colours colour:string; \
	mix phx.gen.schema schema Size sizes size:string
