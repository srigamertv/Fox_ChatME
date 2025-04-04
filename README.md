# Fox ChatME

- Sistema completo de **/me** em 3D para  RedM. Ideal para servidores Roleplay que querem mais imersão e clareza na comunicação entre jogadores próximos.
- :gear: Funcionalidades:

:white_check_mark: Comando **/me**
Permite que o jogador digite uma ação (ex: **/me** está tossindo) que será exibida em texto 3D acima da cabeça do personagem.

:white_check_mark: Detecção de Distância
A mensagem só é visível para jogadores dentro de uma distância configurável (Config.distanceME), evitando spam em todo servidor.

:white_check_mark: Quebra de Texto Automática
Mensagens com mais de 45 caracteres são automaticamente quebradas em múltiplas linhas, com tempo de exibição ajustado com base no tamanho total da mensagem.

:white_check_mark: Exibição no Chat (Opcional)
Você pode ativar/desativar a exibição do texto no chat via Config.chatMessageMe.

:white_check_mark: Fundo Transparente Dinâmico
Desenha um fundo ajustado com base na quantidade e comprimento das linhas, melhorando a leitura da mensagem em diferentes cenários.

- :wrench: Configuração
```lua
Config = {}

Config.timeME = 8000 -- Tempo base que o texto ficará na tela (em ms)
Config.distanceME = 15.0 -- Distância máxima para visualização
Config.chatMessageMe = true -- Mostra a mensagem no chat também
```
- :brain: Como Funciona
O jogador usa o comando **/me** com a mensagem.

A mensagem é enviada ao servidor.

O servidor detecta os jogadores próximos e envia a mensagem apenas para eles.

A função BreakText divide a mensagem em linhas com no máximo 45 caracteres.

O tempo de exibição aumenta dinamicamente conforme o tamanho da mensagem.

O cliente exibe o texto em 3D sobre a cabeça do jogador, com fundo e estilo visual.

- :open_file_folder: Arquivos Incluídos

client.lua

server.lua

config.lua

**Video Preview:**

| [![Assista ao vídeo](https://img.youtube.com/vi/Wu5vs6bl2cU/0.jpg)](https://www.youtube.com/watch?v=Wu5vs6bl2cU) |
| --- |

 <br>

**MINHA LOJA:**
<div> 
   <a href="https://discord.gg/ySk8WVzY5n" target="_blank"><img src="https://img.shields.io/badge/Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white" target="_blank"></a>
</div>

 <br>

**Siga-nos:**
<div> 
  <a href="https://www.youtube.com/@SRIGAMERTV" target="_blank"><img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" target="_blank"></a>
  <a href="https://www.instagram.com/sr.igamer_tv" target="_blank"><img src="https://img.shields.io/badge/-Instagram-%23E4405F?style=for-the-badge&logo=instagram&logoColor=white" target="_blank"></a>
   <a href="https://discord.gg/kh2KTGvaVX" target="_blank"><img src="https://img.shields.io/badge/Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white" target="_blank"></a>
</div>

 <br>

**Entrar-contato:**
 <div>
    <a href = "mailto:kelvinsom22kb@gmail.com"><img src="https://img.shields.io/badge/-Gmail-%23333?style=for-the-badge&logo=gmail&logoColor=white" target="_blank"></a>
 </div>

 <br>

- :unlock: Licença

:fire: Este script está sendo lançado gratuitamente pois tem gente tentando lucrar com um recurso simples e básico.
Se você pagou por isso, sinto muito, foi enganado. Use essa versão open-source e compartilhe com quem quiser.
Não permita que vendam conteúdo básico pro seu servidor!
