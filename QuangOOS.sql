
create table roles(
	id varchar(50) primary key,
	role_name varchar(20)
);


create table users(
	id uuid primary key,
	user_name varchar(50),
	password varchar(100),
	image text,
	full_name varchar(100),
	phone_number varchar(12),
	email varchar(120),
	date_of_birth date,
	address varchar(200),
	role_id varchar(50) references roles(id),
	deleted bool default false,
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);

create table categories(
	id uuid primary key,
	name varchar(100),
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);

create table products(
	id varchar(100) primary key,
	category_id uuid references categories(id),
	title varchar(250),
	origin_price double precision,
	sale_price double precision,
	discount double precision,
	description text,
	deleted bool,
	classify varchar(100),
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);

create table galeries(
	id uuid primary key,
	product_id varchar(100) references products(id),
	image text,
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);

create table feedbacks(
	id uuid primary key,
	user_id uuid references users(id),
	product_id varchar(100) references products(id),
	note text,
	star int default 0,
	image text,
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);

create table coupons(
	code varchar(100) PRIMARY key,
	discount double precision,
	expiration_date timestamp,
	expired bool default false,
	quantity int,
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);

create table orders(
	id uuid primary key,
	user_id uuid references users(id),
	full_name varchar(100) not null,
	phone_number varchar(12) not null,
	address varchar(250) ,
	note varchar(200),
	orderDate timestamp,
	status varchar(100),
	coupon_code varchar(100) references coupons(code),
	total_money double precision check(total_money >= 0),
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);

create table order_detail(
	id uuid primary key,
	order_id uuid references orders(id),
	product_id varchar(100) references products(id),
	price double precision check(price >= 0),
	quantity int check(quantity > 0),
	total_money double precision,
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);

create table image_product(
	id uuid primary key,
	image_name varchar(100),
	product_id varchar(100) references products(id) on delete cascade,
	url text,
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);

create table notifications(
	id uuid primary key,
	user_id uuid references users(id),
	order_detail_id uuid references order_detail(id),
	content text,
	read bool default false,
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);

create table carts(
	id uuid primary key,
	user_id uuid references users(id),
	product_id varchar(100) references products(id),
	quantity int,
	created_at timestamp,
	created_by varchar(100),
  	updated_at timestamp,
  	updated_by varchar(100)
);