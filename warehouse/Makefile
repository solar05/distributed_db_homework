run:
	mix phx.server
run-interactive:
	iex -S mix phx.server
migrate:
	mix ecto.migrate
rollback:
	mix ecto.rollback --all
create-migrations:
	mix phx.gen.schema Handbook handbooks type:string article:string mark:string price:integer gender:string; \
	mix phx.gen.schema Colour colours colour:string; \
	mix phx.gen.schema schema Size sizes size:string; \
	mix phx.gen.schema ClotheExample clothe_examples; \
	mix phx.gen.schema EmployeePosition employee_position position_name:string position_salary:integer; \
	mix phx.gen.schema Magazine magazine city:string street:string house:integer inn:integer; \
	mix phx.gen.schema ClotheInStore clothe_in_store quantity:integer; \
	mix phx.gen.schema Employee employee first_name:string last_name:string birth_date:date hire_date:date passport_number:string phone_number:string; \
	mix phx.gen.schema SalesRecepeit sales_recepeit sum:integer sold_date:date cashbox_num:integer; \
	mix phx.gen.schema ClotheSoldList clothe_sold_list quantity:integer; \
	mix phx.gen.schema ClotheOrder clothe_order is_ordered:boolean quantity:integer; \
	mix phx.gen.schema ClotheOrderList clothe_order_list order_date:date; \
	mix phx.gen.schema ClotheInStock clothe_in_stock quantity:integer place:integer; \
	mix phx.gen.schema ClotheSupplied clothe_supplied arrive_date:date quantity:integer; \
