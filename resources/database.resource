*** Settings ***
Documentation        Gerenciando a massa de testes atraves do banco de dados

Library    DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database    psycopg2
    ...                    amumeiyi
    ...                    amumeiyi
    ...                    arqLG4C2i7BY_FE1wi4y4WJMAHNfeRnU
    ...                    isabelle.db.elephantsql.com
    ...                    5432  # Porta correta para PostgreSQL

Select Student Where Email
    [Arguments]    ${email}

    ${query}        Set Variable
    ...             SELECT * FROM public.students WHERE email = '${email}';
    
    ${result}       Query           ${query}

    [return]                  ${result}[0]
  
Delete Enroll By Email
    [Arguments]     ${email}

    ${user}         Select Student Where Email        ${email} 
    ${query}        Set Variable
    ...             DELETE FROM public.enrollments WHERE student_id = '${user}[0]';
    
    Execute SQL String    ${query}

#Helpers
Reset Student Enroll
    [Arguments]        ${email}
    Connect To Postgres
    Delete Enroll By Email    ${email}
    Disconnect From Database