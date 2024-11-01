*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                       https://staging.ciclic.com.br/seguro-celular/
${SIMULAR}                   xpath=//a[contains(text(), 'Simular seguro celular')] 
${PROXIMO}                   xpath=//button[@data-v-b9d41504 and @loading='false']
${CPF}                       061.222.000-18
${SELECIONAR_DISPOSITIVO}    xpath=//div[contains(@class, 'button-card__card') and contains(@class, 'button-card__card--simple') and contains(., 'Celular')]
${MARCA_DISPOSITIVO}         xpath=//div[contains(@class, 'button-card__card') and contains(@class, 'button-card__card--icon-big') and .//img[contains(@src, 'apple.svg')]]
${CLICAR_CAMPO_MODELO}       xpath=//input[@id='search'] 
${CLICAR_IPHONE}             xpath=//li[contains(text(), 'IPHONE 14')]
${CAPACIDADE_MEMORIA}        xpath=//li[contains(text(), '128GB')]
${BOTAO_PROXIMO}             xpath=//*[@id="app"]/main/div/div/footer/div/button
${BOLSA_PROTEGIDA_NAO}       xpath=//a[text()='Não, obrigado'] 
${NOME_COMPLETO}             Diego Fonseca
${DATA_NASCIMENTO}           25111987
${CPF_USUARIO}               061.222.000-18     
${TELEFONE}                  34991768693  
${EMAIL}                     diegofonseca@ciclic.com.br
${CEP}                       38705386
${STREET_NUMBER}             4580
${CONTINUAR}                 xpath=//button[contains(@class, 'btn__nextStep')]
${NUMERO_CARTAO}             4111 1111 1111 1111
${VALIDADE_CARTAO}           12/25
${CODIGO_SEGURANCA}          123
${NOME_TITULAR}              Fulano da Silva
${CPF_CARTAO}                061.222.000-18    
${CAMPO_PARCELAS}            id=installments
${OPCAO_PARCELAS_7}          xpath=//select[@id='installments']/option[@value='7']
${OPCAO_PARCELAS_6}          xpath=//select[@id='installments']/option[@value='6']
${CONFIRMAR_TERMO}           id=opt-in-1
${CONCLUIR_PAGAMENTO}        xpath=//button[contains(text(), 'Concluir pagamento')]
${ICONE_FECHAR}              xpath=//img[@alt='Fechar']


*** Keywords ***
Abrir Site
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Aguardar site carregar
    Wait Until Element Is Visible    id:page-content    10s

Simular
    Wait Until Element Is Visible    ${SIMULAR}    20s
    Click Element                    ${SIMULAR} 
 
Selecionar Conta Ciclic ou Nao
    Wait Until Element Is Visible    css=label[for="selection-dont-have"]    20s
    Click Element    css=label[for="selection-dont-have"]
    Wait Until Element Is Visible    css=button.page__button    20s
    Click Element    css=button.page__button

Nome Completo
    [Arguments]    ${nome_completo}
    Wait Until Element Is Visible    css=#your-name    20s
    Wait Until Element Is Enabled    css=#your-name    20s
    Click Element    css=#your-name
    Input Text    css=#your-name    ${nome_completo}

Proxima pagina
    Wait Until Element Is Visible    css=.page__button    30s
    Wait Until Element Is Enabled    css=.page__button    30s
    Click Element    css=.page__button

Preencher e-mail
    [Arguments]    ${email}
    Wait Until Element Is Visible    css=#your-email    30s
    Wait Until Element Is Enabled    css=#your-email    30s
    Click Element    css=#your-email
    Input Text    css=#your-email    ${email}

Preencher Telefone
    [Arguments]    ${telefone}
    Click Element    css=#your-phone
    Input Text    css=#your-phone    ${telefone}

Aceitar termo
    Wait Until Element Is Visible    css:label[for="terms"]    30s
    Click Element    css:label[for="terms"]
    Wait Until Element Is Visible    css:label[for="terms"]    30s
    Click Element    css:button.button--md.button--primary.page__button

Selecionar dispositivo
    Wait Until Element Is Visible    ${SELECIONAR_DISPOSITIVO}
    Click Element    ${SELECIONAR_DISPOSITIVO}

Selecionar marca
    Wait Until Element Is Visible    ${MARCA_DISPOSITIVO}    20s
    Click Element    ${MARCA_DISPOSITIVO}

Selecionar modelo
    Wait Until Element Is Visible    ${CLICAR_CAMPO_MODELO}    20s
    Click Element    ${CLICAR_CAMPO_MODELO}    
    Wait Until Element Is Visible    ${CLICAR_IPHONE}    20s
    Click Element    ${CLICAR_IPHONE}

Selecionar memoria
    Wait Until Element Is Visible    ${CAPACIDADE_MEMORIA}   20s
    Click Element    ${CAPACIDADE_MEMORIA}    

Clicar proximo
    Wait Until Element Is Visible    ${BOTAO_PROXIMO}    30s
    Click Element    ${BOTAO_PROXIMO}
    Sleep    2s
    
Bolsa protegida
     Wait Until Element Is Visible    xpath=//a[text()='Não, obrigado']    timeout=10
     Click Element    xpath=//a[text()='Não, obrigado']
     Sleep  2s
   

Preencher Nome
    Wait Until Element Is Visible    id=name    timeout=10
    Click Element    id=name
    Input Text    id=name    ${NOME_COMPLETO}
    
 
Data nascimento
     Wait Until Element Is Visible    id:birthday  20s
     Input Text    id:birthday    ${DATA_NASCIMENTO}

Numero CPF
    Wait Until Element Is Visible    id:cpf
    Input Text    id:cpf    ${CPF}

Numero Telefonse
    Wait Until Element Is Visible    id=cellphone    timeout=10
    Input Text    id=cellphone    ${TELEFONE}

Preencher e Confirmar E-mail
    Wait Until Element Is Visible    id:email
    Input Text    id:email    ${EMAIL}
    Wait Until Element Is Visible    id:checkEmail
    Input Text    id:checkEmail    ${EMAIL}
    Sleep   1s

Clicar Botão Continuar
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'Continuar')]    timeout=10
    Click Element    xpath=//button[contains(text(), 'Continuar')]
    
Preencher Campo CEP
    Wait Until Element Is Visible    id=zipcode    timeout=30
    Input Text    id=zipcode    ${CEP}
    Sleep  5s

Preencher Campo Número da Rua
     [Arguments]    ${numero}
    Wait Until Element Is Visible    id:streetNumber    timeout=30
    Input Text    id:streetNumber    ${numero}
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep  2s    

 Selecionar Botao Continuar
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div/div[2]/div[3]/div[1]/div[2]/div[2]/div[4]/button   timeout=10
    Click Element    xpath=//*[@id="app"]/div/div[2]/div[3]/div[1]/div[2]/div[2]/div[4]/button

Selecionar Meio de Pagamento
    [Arguments]    ${meio_pagamento}
    Wait Until Element Is Visible    xpath=//span[contains(text(), 'Selecione um meio de pagamento')]    timeout=10
    Click Element    xpath=//span[contains(text(), 'Selecione um meio de pagamento')]

Cartao de Credito
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'payment-options__list__item__description') and contains(., 'Cartão de Crédito')]    timeout=10
    Click Element    xpath=//div[contains(@class, 'payment-options__list__item__description') and contains(., 'Cartão de Crédito')]

Preencher Numero do Cartao
    Wait Until Element Is Visible    id=numberCard      20s
    Click Element    id=numberCard
    Input Text    id=numberCard    ${NUMERO_CARTAO}    

Preencher Validade do Cartao
    Wait Until Element Is Visible    id=validateCard    20s
    Input Text    id=validateCard    ${VALIDADE_CARTAO}

Preencher Código de Segurança
    Wait Until Element Is Visible    id=securityCode    20s
    Input Text    id=securityCode    ${CODIGO_SEGURANCA}

Titular do Cartão
    Wait Until Element Is Visible    id=nameCard    20s
    Input Text    id=nameCard    ${NOME_TITULAR}

Preencher CPF do Cartão
    Wait Until Element Is Visible    id=cpfCard    20s
    Input Text    id=cpfCard    ${CPF_CARTAO}

Selecionar Parcelas
    Wait Until Element Is Visible    ${CAMPO_PARCELAS}    20s
    Click Element    ${CAMPO_PARCELAS}  # Clica no campo de seleção
    Wait Until Element Is Visible    ${OPCAO_PARCELAS_7}    20s  # Aguarda a opção ser exibida
    Click Element    ${OPCAO_PARCELAS_7}                    
    Sleep  3s

Confirmar Termos
    Wait Until Element Is Visible     xpath=//*[@id="app"]/div/div[2]/div[3]/div[1]/div[3]/div[2]/div[2]/div[2]/fieldset[1]/label          30s
    Execute JavaScript    window.scrollBy(0, 500)
    Click Element    xpath=//*[@id="app"]/div/div[2]/div[3]/div[1]/div[3]/div[2]/div[2]/div[2]/fieldset[1]/label    
    Sleep   5s

Selecionar Nova Parcelas
    Wait Until Element Is Visible    ${CAMPO_PARCELAS}    20s
    Click Element    ${CAMPO_PARCELAS}  # Clica no campo de seleção
    Wait Until Element Is Visible    ${OPCAO_PARCELAS_6}    20s  # Aguarda a opção ser exibida
    Click Element    ${OPCAO_PARCELAS_6}                    
    Sleep  3s

Clicar Botao Concluir Pagamento
    Wait Until Element Is Visible    ${CONCLUIR_PAGAMENTO}    20s
    Click Element    ${CONCLUIR_PAGAMENTO}
    Sleep  5s

Clicar Icone Fechar
    Wait Until Element Is Visible    ${ICONE_FECHAR}    20s
    Click Element    ${ICONE_FECHAR}

*** Test Cases ***
Cenário 1:Seguro Celular - Cartão - Sem Bolsa Protegida
    Abrir Site
    Aguardar site carregar
    Simular
    Selecionar Conta Ciclic ou Nao
    Nome Completo    Diego Fonseca
    Proxima pagina
    Preencher e-mail    diegofonseca@ciclic.com.br
    Preencher Telefone    349900000000
    Aceitar termo
    Proxima pagina
    Selecionar dispositivo
    Selecionar marca
    Selecionar modelo
    Selecionar memoria
    Clicar proximo
    Bolsa protegida
    Preencher Nome 
    Data nascimento  
    Numero CPF
    Numero Telefonse
    Preencher e Confirmar E-mail
    Clicar Botão Continuar
    Preencher Campo CEP
    Preencher Campo Número da Rua  ${STREET_NUMBER}
    Selecionar Botao Continuar
    Selecionar Meio de Pagamento    $
    Cartao de Credito
    Preencher Numero do Cartao   
    Preencher Validade do Cartao  
    Preencher Código de Segurança
    Titular do Cartão
    Preencher CPF do Cartão
    Selecionar Parcelas    
    Confirmar Termos
    Selecionar Nova Parcelas
    Clicar Botao Concluir Pagamento
    Clicar Icone Fechar
    [Teardown]  Close Browser

   
    
