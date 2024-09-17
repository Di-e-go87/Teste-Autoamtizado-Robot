*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                       https://staging.ciclic.com.br/seguro-equipamentos-portateis/
${FECHAR_BANNER}             css:.icon.image-banner__close
${SIMULAR}                   xpath=//a[contains(text(), 'Simular proteção')]
${PROXIMO}                   xpath=//button[@data-v-b9d41504 and @loading='false']
${CPF}                       061.222.000-18
${SELECIONAR_DISPOSITIVO}    xpath=//div[contains(@class, 'button-card__card') and contains(@class, 'button-card__card--simple') and contains(., 'Celular')]
${MARCA_DISPOSITIVO}         xpath=//div[contains(@class, 'button-card__card') and contains(@class, 'button-card__card--icon-big') and .//img[contains(@src, 'apple.svg')]]
${CLICAR_CAMPO_MODELO}       xpath=//input[@id='search'] 
${CLICAR_IPHONE14}           xpath=//li[contains(text(), 'IPHONE 14 PRO MAX')]
${CAPACIDADE_MEMORIA}        xpath=//li[contains(text(), '128GB')]
${BOTAO_PROXIMO}             xpath=//*[@id="app"]/main/div/div/footer/div/button
${BOLSA_PROTEGIDA_NAO}       xpath=//div[contains(@class, 'addon__footer')]//a[contains(text(), 'Não, obrigado')] 
${NOME_COMPLETO}             xpath=//div[@id='app']/div/div[2]/div[3]/div/div/div[2]/div/fieldset/div/input
${DAT_NASCIMENTO}            xpath=//input[@id='birthday']
*** Keywords ***
Abrir Site
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Aguardar site carregar
    Wait Until Element Is Visible    id:page-content    10s

Fechar Banner
    Wait Until Element Is Visible    ${FECHAR_BANNER}    20s
    Click Element    ${FECHAR_BANNER}

Simular
    Wait Until Element Is Visible    ${SIMULAR}    10s
    Click Element    ${SIMULAR}

Selecionar Conta Ciclic ou Nao
    Wait Until Element Is Visible    css:button.button--md.button--primary.page__button    20s
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
    Wait Until Element Is Visible    ${CLICAR_IPHONE14}    20s
    Click Element    ${CLICAR_IPHONE14}

Selecionar memoria
    Wait Until Element Is Visible    ${CAPACIDADE_MEMORIA}   20s
    Click Element    ${CAPACIDADE_MEMORIA}    

Clicar proximo
    Wait Until Element Is Visible    ${BOTAO_PROXIMO}    30s
    Click Element    ${BOTAO_PROXIMO}
    
Bolsa protegida
    Wait Until Element Is Visible    ${BOLSA_PROTEGIDA_NAO}    20s
    Click Element    ${BOLSA_PROTEGIDA_NAO}

Dados pessoais nome
     [Arguments]    ${nome_completo}
    Wait Until Element Is Visible    ${NOME_COMPLETO}    30s
    Wait Until Element Is Enabled    ${NOME_COMPLETO}    30s
    Click Element                    ${NOME_COMPLETO}
    Clear Element Text               ${NOME_COMPLETO}    
    Input Text                       ${NOME_COMPLETO}    ${nome_completo}
   


Dados pessoais data de nascimento
    Wait Until Element Is Visible    ${DAT_NASCIMENTO}    30s
    Wait Until Element Is Enabled    ${DAT_NASCIMENTO}    30s
    Click Element                    ${DAT_NASCIMENTO}
    Clear Element Text               ${DAT_NASCIMENTO}    
    Input Text                       ${DAT_NASCIMENTO}    25111987    # Exemplo de data

*** Test Cases ***
Cenário 1: Jornada Seguro Portateis - Cartão - Sem Bolsa Protegida
    Abrir Site
    Aguardar site carregar
    Fechar Banner
    Simular
    Selecionar Conta Ciclic ou Nao
    Preencher Nome Completo    Diego Fonseca
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
    #Dados pessoais nome   Jose da Silva
    #Dados pessoais data de nascimento  
    [Teardown]  Close Browser  

   
    
