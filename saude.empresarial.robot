*** Settings ***
Library    SeleniumLibrary
Library    gerador_cpf.py 
Library    gerador_telefone.py
Library    String
Library    gerador_nome.py



*** Variables ***
${URL}                        https://produtos.staging.ciclic.com.br/saude-empresarial/portal/login/
${CNPJ}                       33.044.712/0001-61
${SENHA}                      Testeqa@1
${ACESSAR_PLATAFORMA}         xpath=//button[contains(text(), 'Acessar')]
${MENU_COLABORADORES}         xpath=//span[contains(text(), 'Colaboradores')]
${ADICIONAR_COLABORADORES}    xpath=//a[contains(text(), 'Adicionar')] 
${SELECIONAR_GENERO}          xpath=//label[@for='1']
${NOME_COMPLETO}              ${None} 
${CPF}                        ${None}
${DATA_NASCIMENTO}            25/11/1987
${NUMERO_TELEFONE}            ${None}
${EMAIL}                      ${None}
${CEP}                        38705-386
${NUMERO_RESIDENCIA}          10


*** Keywords ***
Abrir Site
    Open Browser                   ${URL}    chrome
    Maximize Browser Window

Inserir CNPJ
    Wait Until Element Is Visible  id=cnpj  10s
    Click Element                  id=cnpj
    Input Text                     id=cnpj  ${CNPJ}

Inserir Senha
    Wait Until Element Is Visible  id=password  10s
    Click Element                  id=password
    Input Password                 id=password  ${SENHA}

Acessar Plataforma
    Wait Until Element Is Visible  ${ACESSAR_PLATAFORMA}  10s
    Click Button                   ${ACESSAR_PLATAFORMA} 
    Sleep                          1s

Menu Colaboradores
    Wait Until Element Is Visible  ${MENU_COLABORADORES}  10s
    Click Element                  ${MENU_COLABORADORES}

Adicionar Colaboradores
    Wait Until Element Is Visible  ${ADICIONAR_COLABORADORES}  10s
    Click Element                  ${ADICIONAR_COLABORADORES} 

Selecionar Genero
    Wait Until Element Is Visible  ${SELECIONAR_GENERO}      30s
    Click Element                  ${SELECIONAR_GENERO}
    Sleep                          1s

Gerar Nome Completo
    ${NOME_COMPLETO}=              Gerar Nome Masculino
    Log                            Nome Gerado: ${NOME_COMPLETO}
    Wait Until Element Is Visible  id=employee-fullname  10s
    Input Text                     id=employee-fullname  ${NOME_COMPLETO}  

Inserir CPF
     ${CPF}=                       Gerar Cpf
    Log                            CPF Gerado: ${CPF}
    Input Text                     id=employee-cpf    ${CPF}

Inserir Data Nascimento
    Wait Until Element Is Visible  id=employee-birthdate    10s
    Click Element                  id=employee-birthdate
    Input Text                     id=employee-birthdate    ${DATA_NASCIMENTO}

Inserir Numero Telefone
    ${TELEFONE}=                   Gerar Telefone
    Log                            Telefone Gerado: ${TELEFONE}
    Input Text                     id=employee-cellphone    ${TELEFONE}            

Inserir E-mail
    ${RANDOM_STRING}=               Generate Random String    10    [LOWER]
    ${EMAIL}=                       Catenate    ${RANDOM_STRING}@example.com
    Log                             Email Gerado: ${EMAIL}
    Input Text                      id=employee-email    ${EMAIL}
    Sleep                           1s
    Input Text                      id=employee-email-confirm    ${EMAIL}

Inserir CEP
    Wait Until Element Is Visible   id=employee-cep    10s
    Click Element                   id=employee-cep
    Input Text                      id=employee-cep    ${CEP}       
    Sleep                           2s    

Inserir Numero
    Wait Until Element Is Visible   id=employee-number       10s
    Input Text                      id=employee-number  ${NUMERO_RESIDENCIA}
    Scroll Element Into View        xpath=//button[contains(text(),'Incluir Colaborador')]  # Rolagem para o botão

Incluir Colaborador
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Incluir Colaborador')]    30s
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'Incluir Colaborador')]    30s
    Click Button                     xpath=//button[contains(text(),'Incluir Colaborador')]
    Sleep                            8s

Cadastro com Sucesso do Colaborador
     Wait Until Element Is Visible   xpath=//h1[contains(@class, 'manual-success__title')]   10s  # Aguarda a mensagem de sucesso
     Element Text Should Be          xpath=//h1[contains(@class, 'manual-success__title')]   Colaborador cadastrado com sucesso
     Sleep                           3s
    
*** Test Cases ***
Cenário 1: Saúde Empresarial - Essencial - Adicionar Colaborador Manualmente
    Abrir Site
    Inserir CNPJ
    Inserir Senha
    Acessar Plataforma
    Menu Colaboradores
    Adicionar Colaboradores
    Selecionar Genero
    Gerar Nome Completo   
    Inserir CPF  
    Inserir Data Nascimento
    Inserir Numero Telefone
    Inserir E-mail
    Inserir CEP
    Inserir Numero
    Incluir Colaborador
    Cadastro com Sucesso do Colaborador
    [Teardown]   Close Browser
    
