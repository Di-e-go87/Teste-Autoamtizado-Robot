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
${CPF}    061.222.000-18
${GENERO_SELECTOR}    xpath=//select[not(@disabled)]
${GENERO_MASCULINO}   MASCULINO
${CONFIRMAR_BUTTON}    xpath=//button[contains(@class, 'p-form__btn') and contains(text(), 'Confirmar')]


*** Keywords ***
Abrir Site
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Aguardar site carregar
    Wait Until Element Is Visible    id:page-content    10s

Fechar Banner 
    Wait Until Element Is Visible    ${FECHAR_BANNER}    20s
    Click Element    ${FECHAR_BANNER}

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
    [Arguments]    ${GENERO_MASCULINO}
    Wait Until Element Is Visible    xpath=//select[not(@disabled)]/option[normalize-space(text())='${GENERO_MASCULINO}']    20s
    Click Element    xpath=//select[not(@disabled)]/option[normalize-space(text())='${GENERO_MASCULINO}']
    Sleep  1s
        
Preencher campo CPF
    [Arguments]    ${cpf}
    Input Text    css:input.input__input.p-form__input__birthdate    25/11/1987
    Wait Until Element Is Visible    id:1-cpf    20s
    Input Text    id:1-cpf    ${cpf} 
    Wait Until Element Is Visible    id:1-cpf    30s
    Sleep  1s

Clicar Botão Confirmar
    Wait Until Element Is Visible    ${CONFIRMAR_BUTTON}    60s
    Scroll Element Into View    ${CONFIRMAR_BUTTON}
    Wait Until Element Is Enabled    ${CONFIRMAR_BUTTON}    60s
    Click Element    ${CONFIRMAR_BUTTON}
    
*** Test Cases ***
Cenário 1: Seguro Viagem Internacional - 1 passageiro - Cartão
    Abrir Site
    Aguardar site carregar
    Fechar Banner 
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
    Selecionar genero   Masculino
    Preencher campo CPF    ${CPF}  
    Clicar Botão Confirmar      
    [Teardown]   Close Browser






