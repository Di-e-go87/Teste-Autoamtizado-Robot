Instalação e configuração do Robot FrameWork
•	Instalar o python e selecionar o menu path na hora de instalar:   https://www.python.org/downloads/

![image](https://github.com/user-attachments/assets/b1e6092a-b268-498e-98de-a9a7d9323f0f)

•	Instalar o robot framework:Abrir o terminal CMD e digitar pip install robotframework

![image](https://github.com/user-attachments/assets/2d9f0860-4be6-4fa2-9866-8bccac7d5b5d)

•	instalar o selenium com robot:No terminal digitar pip install robotframework-seleniumlibrary

![image](https://github.com/user-attachments/assets/e8ae0661-bd00-4747-b1ea-cc19705ebb22)

• instalar a versão boa para o selenium: No terminal digitar pip install selenium==4.9.0

![image](https://github.com/user-attachments/assets/4d72d139-74f3-4929-904b-95b93759c2b9)

•	Verificar sua versão do Google Chrome em: Ajuda> Sobre o Google Chrome 

![image](https://github.com/user-attachments/assets/5388b2c9-cacb-46c7-b5d8-11fffbc6dd4b)

•	Baixar e extrair o chromedriver de acordo com sua versão do Google Chrome

![image](https://github.com/user-attachments/assets/175f3a56-eb4b-4997-8a57-95e2e381323d)

•	pega o caminho do python em variáveis de ambiente >Path>copia o caminho com final / script: C:\Users\QA\AppData\Local\Programs\Python\Python312\Scripts\(Colar esse caminho na barra de pesquisa dentro do Disco:C)
![image](https://github.com/user-attachments/assets/5fca9a69-65e1-4f20-876a-4620c240ae8e)

•	Colar chromedriver dentro do caminho acima.

![image](https://github.com/user-attachments/assets/29a05637-5395-435d-b3e9-9b85177eaf1c)

•	Baixa o visual studio: https://code.visualstudio.com/download

•	Instala a extensão robot framework intellisense

![image](https://github.com/user-attachments/assets/cadbdca7-8715-4854-bc52-97254335f686)

•	Cria uma pasta no seu computador (robot)onde o  projeto e o arquivo de teste vai ser salvo
•	Abrir essa pasta no Vscode pelo >open folder

![image](https://github.com/user-attachments/assets/04eff910-a603-4cc7-b1e0-f80b574d81ab)

•	Após abrir a pasta que criou clicar em > New File e nomear esse arquivo de teste.robot
•	Depois de criar esse arquivo colar esse script dentro do arquivo

** Settings **
Library  SeleniumLibrary
** Variables **
** Keywords **
Abrir Site
Open Browser https://staging.ciclic.com.br/seguro-viagem/     chrome
** Test Cases **
Cenário 1: Acessando o site do Robot
Abrir Site

•	Após colar o script instalar a extensão Robot Framework Intellisense

![image](https://github.com/user-attachments/assets/bfd950d0-99aa-4956-ad1d-d503b9a501e9)

•	Comando para rodar o teste : robot teste.robot
