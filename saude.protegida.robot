*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Library    OperatingSystem
Library    String
Library    random  
Library    gerador_cpf.py


*** Variables ***
${URL}                       https://staging.ciclic.com.br/saude-protegida/
${SIMULAR}                   xpath=//a[contains(text(), 'Simular proteção')]
${SELECIONAR_PLANO}          xpath=//*[@id="app"]/section/div/div[2]/div[3]/div/div[5]/div[2]/button
${SELECIONAR_GENERO}         xpath=//*[@id="app"]/section/div/div[2]/div/fieldset[1]/div[2]
${NOME_COMPLETO}             xpath=//*[@id="app"]/section/div/div[2]/div/fieldset[2]/div
${CPF}                       None
${CONTINUAR_JORNADA}         xpath=//*[@id="app"]/section/div/div[2]/div/button
${CEP}                       38705386
${NUMERO}                    4580
${CONTINUAR}                 xpath=//button[contains(@class, 'btn__nextStep')]
${FORMA_PAGAMENTO}           xpath=//*[@id="app"]/div/div[2]/div[3]/div[1]/div[2]/div[2]/div[1]/div/span
${NUMERO_CARTAO}             4111 1111 1111 1111
${CVV}                       123
${VALIDADE_CARTAO}           12/24 
${NOME_TITULAR}              Diego Fonseca



*** Keywords ***
#Gerar CPF Aleatório
    #[Documentation]    Gera um CPF aleatório válido.
    #${cpf_part1}=    Generate Random Digits    9  # Gera 9 dígitos
    #${d1}=    Evaluate    sum(int(${cpf_part1}[index]) * (10 - index) for index in range(9)) % 11
    #${d1}=    Set Variable    ${d1} if ${d1} < 2 else 11 - ${d1}
    #${cpf_part2}=    Set Variable    ${cpf_part1}${d1}
    #${d2}=    Evaluate    sum(int(${cpf_part2}[index]) * (11 - index) for index in range(10)) % 11
    #${d2}=    Set Variable    ${d2} if ${d2} < 2 else 11 - ${d2}
    #${cpf_final}=    Set Variable    ${cpf_part2}${d2}
    #[Return]    ${cpf_final}

#Generate Random Digits
    #[Arguments]    ${length}
    #${digits}=    Evaluate    ''.join([str(random.randint(0, 9)) for _ in range(${length})])    modules=random
    #RETURN    ${digits}  
    
Abrir Site
    Open Browser    ${URL}    chrome
    Maximize Browser Window    

Aguardar site carregar
    Wait Until Element Is Visible    id:page-content    10s 

Simular
    Wait Until Element Is Visible    ${SIMULAR}    10s
    Click Element    ${SIMULAR}

Selecionar Plano
    Wait Until Element Is Visible    ${SELECIONAR_PLANO}    10s
    Click Element    ${SELECIONAR_PLANO}

Selecionar genero
    Execute Javascript    document.body.style.zoom = '90%';
    Wait Until Element Is Visible    ${SELECIONAR_GENERO}    10s
    Click Element    ${SELECIONAR_GENERO}

Nome completo
    [Arguments]    ${nome_completo}
    Wait Until Element Is Visible    css=input#name    30s
    Click Element    css=input#name
    Clear Element Text    css=input#name
    Input Text    css=input#name    ${nome_completo}

Data nascimento
    [Arguments]    ${data_nascimento}
    Wait Until Element Is Visible    css=input#birthDate    30s
    Click Element    css=input#birthDate
    Clear Element Text    css=input#birthDate
    Input Text    css=input#birthDate    ${data_nascimento}

Gerar CPF Aleatório
    ${CPF}=                        Gerar Cpf
    Log                            CPF Gerado: ${CPF}
    Input Text                     id=employee-cpf    ${CPF}

Preencher CPF
    [Arguments]    ${cpf}
    Wait Until Element Is Visible    id:cpf    10s
    Click Element    id:cpf
    Input Text    id:cpf    ${cpf}


Gerar Telefone Aleatório
    ${ddd}    Evaluate    ''.join([str(random.randint(0, 9)) for _ in range(2)])    modules=random
    ${numero}    Evaluate    '9' + ''.join([str(random.randint(0, 9)) for _ in range(8)])    modules=random
    ${telefone_completo}    Set Variable    (${ddd}) ${numero}
    RETURN    ${telefone_completo}

Preencher celular
    [Arguments]    ${celular}
    Wait Until Element Is Visible    css=input#phone    30s
    Click Element    css=input#phone
    Clear Element Text    css=input#phone
    Input Text    css=input#phone    ${celular}

Gerar E-mail Aleatório
    ${nome}    Evaluate    ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=7))    modules=random
    ${dominio}    Set Variable    example.com
    ${email}    Set Variable    ${nome}@${dominio}
    RETURN     ${email}

Preencher e-mail
    [Arguments]    ${email}
    Wait Until Element Is Visible    css=input#email    30s
    Click Element    css=input#email
    Clear Element Text    css=input#email
    Input Text    css=input#email    ${email}

Confirmar e-mail
    [Arguments]    ${email}
    Wait Until Element Is Visible    css=input#checkEmail    30s
    Click Element    css=input#checkEmail
    Clear Element Text    css=input#checkEmail
    Input Text    css=input#checkEmail    ${email}

Aceitar Termos
    Run Keyword And Ignore Error    Marcar Checkbox Usando JavaScript

Marcar Checkbox Usando JavaScript
    [Arguments]    ${checkbox_id}=termsUse
    Execute JavaScript    document.getElementById('${checkbox_id}').click()

Continuar jornada
    Click Element    ${CONTINUAR_JORNADA}    

Inserir CEP
    Wait Until Element Is Visible    id=zipcode
    Click Element    id=zipcode
    Input Text    id=zipcode    ${CEP}
    sleep  3s

Inserir numero
    Wait Until Element Is Visible    id=streetNumber  20s
    Click Element    id=streetNumber
    Input Text    id=streetNumber    ${NUMERO}    

Continuar
     Click Element     ${CONTINUAR}  
     Sleep  1s 

Forma de pagamento
    # Primeiro clique para abrir o menu de formas de pagamento
    Wait Until Element Is Visible    xpath=//span[contains(@class, 'payment-options__label-default')]    10s
    Scroll Element Into View         xpath=//span[contains(@class, 'payment-options__label-default')]
    Click Element                    xpath=//span[contains(@class, 'payment-options__label-default')]
    Sleep                            1s

    # Aguardar e verificar se a lista de opções está visível
    Wait Until Element Is Visible    xpath=//ol[contains(@class, 'payment-options__list') and not(contains(@style, 'display: none'))]    10s

    # Selecionar a opção "Cartão de Crédito" dentro da lista
    Wait Until Element Is Visible    xpath=//strong[text()='Cartão de Crédito']    10s
    Scroll Element Into View         xpath=//strong[text()='Cartão de Crédito']
    Click Element                    xpath=//strong[text()='Cartão de Crédito']          

Numero Cartão
    Wait Until Element Is Visible    id=numberCard      20s
    Click Element    id=numberCard
    Input Text    id=numberCard    ${NUMERO_CARTAO}     

Validade Cartão
    Wait Until Element Is Visible    id=validateCard       20s
    Click Element    id=validateCard
    Input Text    id=validateCard    ${VALIDADE_CARTAO}    

Inserir CVV
    Wait Until Element Is Visible    id=securityCode    30s
    Click Element    id=securityCode
    Input Text    id=securityCode    ${cvv}

Nome Titular
    Wait Until Element Is Visible    id=nameCard      10s
    Click Element    id=nameCard        
    Input Text    id=nameCard    ${NOME_TITULAR}   

CPF do Titular
    Wait Until Element Is Visible    id=cpfCard
    Click Element    id=cpfCard
    Input Text    id=cpfCard    ${CPF}

Aceitar Termos de uso
    Click Element    xpath=//label[@for='opt-in-1']

Aceitar Periodo carencia
    Click Element    xpath=//label[@for='opt-in-2']

Concluir pagamento
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'btn__completePayment')]    10s
    Click Element    xpath=//button[contains(@class, 'btn__completePayment')]
    Sleep   5s

Sucesso da compra
    Wait Until Element Is Visible    xpath=//h1[contains(@class, 'top__title')]    10s  # Aguarda a mensagem de sucesso
    Element Text Should Be    xpath=//h1[contains(@class, 'top__title')]    Parabéns! Sua compra foi realizada!
    Sleep  2s



*** Test Cases ***
Cenário 1: Saude Protegida - Plano Plus - Sem Dependente - Cartão de Crédito
    Abrir Site
    Aguardar site carregar
    Simular
    Selecionar Plano
    Selecionar genero  
    Nome completo   Diego Fonseca
    Data nascimento  25111987
    ${cpf_gerado} =    Gerar CPF Aleatório  # Gera um CPF válido
    Preencher CPF    ${cpf_gerado}  # Passa o CPF gerado como argumento   
    ${telefone} =    Gerar Telefone Aleatório
    Preencher celular  ${telefone}
    ${email} =    Gerar E-mail Aleatório
    Preencher e-mail   ${email}
    Confirmar e-mail   ${email}
    Aceitar Termos
    Continuar jornada  
    Inserir CEP  
    Inserir numero
    Continuar
    Forma de pagamento
    Numero Cartão    
    Validade Cartão
    Inserir CVV
    Nome Titular
    CPF do Titular
    Aceitar Termos de uso
    Aceitar Periodo carencia
    Concluir pagamento
    Sucesso da compra
    [Teardown]   Close Browser
    
