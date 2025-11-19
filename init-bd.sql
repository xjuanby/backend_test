create table owners(
	id serial primary key,
	identification VARCHAR(50) not null unique,
	full_name VARCHAR(300),
	payments numeric(10,2) default 0,
	balance numeric(10,2) default 0,
	created_at timestamp,
	updated_at timestamp
);


create table vehicles(
	id serial primary key,
	owner_id BIGINT not null REFERENCES owners(id),
	license_plate VARCHAR(10) not null unique,
	color VARCHAR(50),
	created_at timestamp,
	updated_at timestamp
);

create table payments(
	id serial primary key,
	owner_id BIGINT not null REFERENCES owners(id),
	payment_method_type  VARCHAR(100),
	amount numeric(10,2),
	created_at timestamp,
	updated_at timestamp,
	deleted_at timestamp
	
);

create table timestamps (
	id serial primary key,
	vehicle_id bigint not null REFERENCES vehicles(id),
	type VARCHAR(3), -- IN/OUT
	created_at timestamp not null,
	updated_at timestamp 
);