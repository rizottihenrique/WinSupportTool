# 🛠️ WinSupportTool

Script em **Batch (.bat)** para centralizar ferramentas de **suporte e reparo no Windows** em um único menu interativo.

Ele é baseado no trabalho original de [Pablo Oliveira](https://github.com/pabloofjunior/Ferramenta/blob/main/menu_suporte.bat), expandido com **novos recursos**, maior organização e integração com ferramentas externas como o **Speedtest CLI**.

---

## 📋 Funcionalidades

O menu oferece diversas opções de diagnóstico, reparo e administração do Windows:

1. Verificar e Reparar Disco (CHKDSK)  
2. Reparar Arquivos de Sistema (SFC)  
3. Limpar Arquivos Temporários  
4. Verificar Erros de Memória (Diagnóstico)  
5. Restaurar Sistema  
6. Verificar Conectividade de Rede (Ping/Teste)  
7. Gerenciar Processos (Task Manager)  
8. Backup de Drivers  
9. Verificar Atualizações do Windows  
10. Informações do Sistema  
11. Limpar Cache DNS  
12. Reiniciar Serviços de Rede  
13. Desfragmentar Disco  
14. Gerenciar Usuários Locais  
15. Verificar Integridade de Arquivos (DISM)  
16. Ativar/Desativar Firewall do Windows  
17. Ver Logs de Eventos  
18. Testar Velocidade de Disco  
19. Criar Ponto de Restauração  
20. Executar Comando Personalizado (CMD)  
21. Atualizar Todos os Programas (Winget Update)  
22. Liberar Memória RAM (Limpar Cache do Standby)  
23. Abrir Configurações Avançadas de Rede  
24. Checar Uso de Disco/CPU/Net em Tempo Real  
25. Escanear Portas Abertas (Netstat)  
26. Exibir IPs e Rotas (ipconfig/route)  
27. **Testar Velocidade de Internet (Speedtest CLI)** ⚡  
28. Desativar Programas de Inicialização  
29. Abrir Editor de Registro (Regedit)  
30. Sair  

---

## 🚀 Novidade do Item 27 – Speedtest CLI

O item **27** usa o [Speedtest CLI oficial da Ookla](https://www.speedtest.net/apps/cli), permitindo medir:

- Latência (Ping)  
- Download  
- Upload  

### Como funciona:
- Se o **Speedtest CLI já estiver baixado** em `%TEMP%\speedtest`, ele será executado diretamente.  
- Se **não existir**, o script baixa automaticamente a versão mais recente do site oficial, extrai e executa.  

---

## 📦 Pré-requisitos

- Windows 10/11  
- Permissão de administrador (para alguns comandos)  
- [Winget](https://learn.microsoft.com/pt-br/windows/package-manager/winget/) instalado (para opção 21)  
- PowerShell habilitado  

---

## 📜 Créditos

- Script original: [menu_suporte.bat - Pablo Oliveira](https://github.com/pabloofjunior/Ferramenta/blob/main/menu_suporte.bat)  
- Expansão e melhorias: Henrique Rizotti  

---
