/* Create the addresses table */ 
CREATE TABLE Addresses(
	a_id int,
	zip int NOT NULL,
	building_number int,
	street_name VARCHAR(50),
	city VARCHAR(30) NOT NULL,
	state VARCHAR(2) NOT NULL,
	PRIMARY KEY (a_id));

/* Create the restaurants table */
CREATE TABLE Restaurants(
	r_id VARCHAR(50), 
	name VARCHAR(255) NOT NULL, 
	cuisine VARCHAR(255), 
	photo_url VARCHAR(255), 
	phone VARCHAR(20), 
	website_url VARCHAR(255), 
	a_id int NOT NULL, 
	PRIMARY KEY (r_id),
	FOREIGN KEY (a_id) REFERENCES Addresses(a_id)); 

CREATE TABLE ViolationSummaries(
	v_id int, 
	date_inspected DATE NOT NULL, 
	violation_count int NOT NULL, 
	grade VARCHAR(2) NOT NULL, 
	r_id VARCHAR(50), 
	CONSTRAINT FOREIGN KEY (r_id) REFERENCES Restaurants(r_id) ON DELETE CASCADE,
	PRIMARY KEY (v_id));

CREATE TABLE Violations(
	v_id int, 
	violation_detail VARCHAR(255), 
	critical TINYINT(1),
	CONSTRAINT v_detail PRIMARY KEY (v_id, violation_detail),
	CONSTRAINT FOREIGN KEY (v_id) REFERENCES ViolationSummaries(v_id) ON DELETE CASCADE);

CREATE TABLE Reviewers(
	u_id VARCHAR(50), 
	name VARCHAR(255), 
	review_count int, 
	average_rating FLOAT(3,2), 
	PRIMARY KEY (u_id));

CREATE TABLE Reviews(
	u_id VARCHAR(50), 
	r_id VARCHAR(50), 
	date_reviewed DATE, 
	comment VARCHAR(255), 
	rating FLOAT(3,2), 
	CONSTRAINT review_id PRIMARY KEY (u_id,r_id),
	FOREIGN KEY (u_id) REFERENCES Reviewers(u_id) ON DELETE CASCADE,
	FOREIGN KEY (r_id) REFERENCES Restaurants(r_id) ON DELETE CASCADE);




