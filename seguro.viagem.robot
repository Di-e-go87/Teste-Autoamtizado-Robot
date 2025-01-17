*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://staging.ciclic.com.br/seguro-viagem/
${PAIS_SELECTOR}    xpath=//div[contains(text(), 'Afeganistão')]  
${DATA_SELECTOR}    xpath=//*[@id="page-content"]/div/section[1]/div[2]/div[2]/div[2]/div/div/div[2]/div[1]
${DATA_EMBARQUE}   xpath=//*[@id="page-content"]/div/section[1]/div[2]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[2]/div/div[2]/div[26]/span
${DATA_DESEMBARQUE}   xpath=//*[@id="page-content"]/div/section[1]/div[2]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[2]/div/div[2]/div[33]
${PASSAGEIROS_IDADE}    xpath=//*[@id="page-content"]/div/section[1]/div[2]/div[2]/div[2]/div/div/div[3]
${PASSAGEIRO_0_A_40}     xpath=//*[@id="page-content"]/div/section[1]/div[2]/div[2]/div[2]/div/div/div[3]/div[2]/div[1]/div[1]/div/button[2]
${COTAR_AGORA}      xpath=//*[@id="page-content"]/div/section[1]/div[2]/div[2]/div[2]/div/button
${PROXIMO}            xpath=//button[@data-v-b9d41504 and @loading='false']
${FECHAR_BANNER}    css:.icon.image-banner__close
${DADOS_PASSAGEIROS}     css:div.p-form__load div.base-toggle
${CPF}                 061.222.000-18
${CAMPO_GENERO}       xpath=//select[@value='']
${OPCAO_MASCULINO}    xpath=//select[@value='']/option[@value='MALE']
${CONFIRMAR_BUTTON}    xpath=//button[contains(@class, 'p-form__btn') and contains(text(), 'Confirmar')]
${NOME_COMPLETO}             xpath=//*[@id="app"]/section/div/div[2]/div/fieldset[2]/div
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

Clicar sobre o menu destino
    Wait Until Element Is Visible    css:.travel-quoter__country-module    10s
    Click Element    css:.travel-quoter__country-module

Clicar sobre o pais de destino
    Wait Until Element Is Visible    ${PAIS_SELECTOR}    10s
    Scroll Element Into View    ${PAIS_SELECTOR}
    Click Element    ${PAIS_SELECTOR}

Clicar data de embarque e desembarque
    Wait Until Element Is Visible    ${DATA_SELECTOR}    10s
    Click Element    ${DATA_SELECTOR}
    Click Element   ${DATA_EMBARQUE}
    Click Element   ${DATA_DESEMBARQUE}

Clicar sobre passageiros e idade
    Wait Until Element Is Visible    ${PASSAGEIROS_IDADE}    20s
    Click Element    ${PASSAGEIROS_IDADE}
    Click Element    ${PASSAGEIRO_0_A_40}

Clicar cotar agora
    Wait Until Element Is Visible    ${COTAR_AGORA}    20s
    Click Element    ${COTAR_AGORA}

Selecionar Conta Ciclic ou Nao
    Wait Until Element Is Visible    css:button.button--md.button--primary.page__button   20s
    Click Element    css:button.button--md.button--primary.page__button

Preencher Nome Completo
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
    Wait Until Element Is Visible     css:label[for="terms"]  30s
    Click Element    css:label[for="terms"]
    Wait Until Element Is Visible     css:label[for="terms"]  30s
    Click Element    css:button.button--md.button--primary.page__button    

Selecionar Plano Ciclic 35
    Wait Until Element Is Visible    css:button.button--md.button--primary.plan__button  30s
    Click Element    css:button.button--md.button--primary.plan__button  
    Sleep  1s

Carregar meus dados
    Wait Until Element Is Visible    ${DADOS_PASSAGEIROS}    30s
    Click Element    ${DADOS_PASSAGEIROS}   

Selecionar genero
    Wait Until Element Is Visible    ${CAMPO_GENERO}    timeout=10s
    Click Element                    ${CAMPO_GENERO}     # Clica para abrir as opções
    Wait Until Element Is Visible    ${OPCAO_MASCULINO}  timeout=10s
    Click Element                    ${OPCAO_MASCULINO}  # Seleciona a opção "Masculino"
        
Preencher campo CPF
    [Arguments]    ${cpf}
    Input Text    css:input.input__input.p-form__input__birthdate    25/11/1987
    Wait Until Element Is Visible    id:1-cpf    20s
    Input Text    id:1-cpf    ${cpf} 
    Wait Until Element Is Visible    id:1-cpf    30s
    

Clicar Botao Confirmar
    Wait Until Element Is Visible    css:.button.button--md.button--secondary.p-form__btn    timeout=5s
    Click Element                    css:.button.button--md.button--secondary.p-form__btn   
    Sleep  9s

Nome e Sobrenome
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div/div[2]/div[3]/div[1]/div[1]/div[2]/div[1]/fieldset/div
    Click Element                     xpath=//*[@id="app"]/div/div[2]/div[3]/div[1]/div[1]/div[2]/div[1]/fieldset/div
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

Preencher Nome do Titular do Cartão
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

Clicar Botao Concluir Pagamento
    Wait Until Element Is Visible    ${CONCLUIR_PAGAMENTO}    20s
    Click Element    ${CONCLUIR_PAGAMENTO}
    Sleep  1s

Clicar Icone Fechar
    Clicar Icone Fechar
    Wait Until Element Is Visible    ${ICONE_FECHAR}    20s
    Click Element    ${ICONE_FECHAR}

    
*** Test Cases ***
Cenário 1: Seguro Viagem Internacional - 1 passageiro - Cartão
    Abrir Site
    Aguardar site carregar
    #Fechar Banner 
    Clicar sobre o menu destino
    Clicar sobre o pais de destino
    Clicar data de embarque e desembarque
    Clicar sobre passageiros e idade
    Clicar cotar agora
    Selecionar Conta Ciclic ou Nao
    Preencher Nome Completo     Diego Fonseca
    Proxima pagina
    Preencher e-mail   diegofonseca@ciclic.com.br
    Preencher Telefone  349900000000     
    Aceitar termo
    Proxima pagina    
    Selecionar Plano Ciclic 35     
    Carregar meus dados 
    Selecionar genero   
    Preencher campo CPF    ${CPF}  
    Clicar Botao Confirmar   
    Nome e Sobrenome    
    [Teardown]   Close Browser






