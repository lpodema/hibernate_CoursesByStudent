create database coursesbystudent;
grant all privileges on coursesbystudent.* to dummy;

CREATE TABLE student(
    st_id INT NOT NULL AUTO_INCREMENT,
    st_name VARCHAR(50) NOT NULL,
    st_lastName VARCHAR(50) NOT NULL,
    st_dni int(10) NOT NULL,
    st_birthDate DATE,
    st_email VARCHAR(50),
    st_phone int(10),
    st_address int(10) NOT NULL,
    PRIMARY KEY (st_id),

);
/*DESPUES DE CREADA ADDRESS*/
ALTER TABLE student
    ADD CONSTRAINT FOREIGN KEY (st_address) references address(st_id)


CREATE TABLE address(
    st_id INT NOT NULL,
    ad_street VARCHAR(50) NOT NULL,
    ad_number SMALLINT NOT NULL,
    ad_postal VARCHAR(50) NOT NULL,
    ad_province integer NOT NULL,
    PRIMARY KEY (st_id),
    FOREIGN KEY (st_id) references student(st_id),
    FOREIGN KEY (ad_province) references province (pr_id)
);


CREATE TABLE province(
    pr_id integer NOT NULL AUTO_INCREMENT,
    pr_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (pr_id)
)


CREATE TABLE course(
    course_id INT NOT NULL AUTO_INCREMENT,
    course_name VARCHAR(80) NOT NULL,
    course_description VARCHAR(200),
    PRIMARY KEY (course_id)
);


CREATE TABLE classInfo(
    cl_id INT NOT NULL AUTO_INCREMENT,
    cl_name VARCHAR(80) NOT NULL,
    cl_description VARCHAR(200) NOT NULL,
    cl_topic VARCHAR(200) NOT NULL,
    PRIMARY KEY (cl_id)
);


CREATE TABLE classesByCourses(
    course_id INT NOT NULL,
    cl_id int NOT NULL,
    PRIMARY KEY (course_id, cl_id),
    FOREIGN KEY (course_id) references course(course_id),
    FOREIGN KEY (cl_id) references classInfo (cl_id)
);


CREATE TABLE courses(
    c_id INT NOT NULL AUTO_INCREMENT,
    c_course INT,
    c_init DATE,
    c_end DATE,
    c_schedule ENUM('Morning', 'Afternoon', 'Evening'),
    c_start TIME,
    PRIMARY KEY (c_id),
    FOREIGN KEY (c_course) references course(course_id)
);


CREATE TABLE coursesByStudent(
    st_id INT NOT NULL,
    c_id INT NOT NULL,
    PRIMARY KEY (st_id, c_id),
    FOREIGN KEY (st_id) references student(st_id),
    FOREIGN KEY (c_id) references courses (c_id)
);
