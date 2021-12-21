
drop database quiz_app;
create database quiz_app;
use tutoria;
use quiz_app;

create table users
(
    user_id int auto_increment not null primary key,
    user_name varchar(100) not null ,
    user_lastname varchar(150),
    user_email varchar(100) not null ,
    user_passwd varchar(500) not null
);

create table categories
(
    category_id int auto_increment not null primary key ,
    category_name varchar(50) not null ,
    category_description varchar (200),
    category_image varchar (1000)
);


create table topics
(
    topic_id int auto_increment not null primary key ,
    topic_name varchar(100) not null ,
    topic_description varchar(1000) not null ,
    topic_image varchar(1000),

    category_id int not null ,

    constraint `fk_c_category_id_to_c.category_id`
        foreign key (category_id) references categories(category_id)

);

create table questions
(
    question_id int auto_increment not null  primary key,
    question_name varchar(200) not null ,
    question_is_active enum('0','1') not null ,

    topic_id int not null ,

    constraint `fk_t.topic_id_to_q.topic_id`
        foreign key (topic_id) references topics(topic_id)
);

create table questions_choices
(
    choice_id int auto_increment not null primary key,
    choice_name varchar(100) not null ,
    is_right_choice enum('0','1') not null ,

    questions_id int not null ,

    constraint `fk_q.question_id_to_qc.question_id`
        foreign key (questions_id) references questions(question_id)
);

create table user_questions_answers
(
    answer_id int auto_increment not null primary key,
    answer_time datetime not null ,
    is_right_answer enum('0', '1') not null ,

    question_id int not null ,
    choice_id int not null ,
    user_id int not null,

    constraint `fk_q.question_id_to_uqa.question_id`
        foreign key (question_id) references questions(question_id),
    constraint `fk_qc.choice_id_to_uqa.choice_id`
        foreign key (choice_id) references questions_choices(choice_id),
    constraint `fk_u.user_id_to_uqa.`
        foreign key (user_id) references users(user_id)
);

drop table user_questions_answers;