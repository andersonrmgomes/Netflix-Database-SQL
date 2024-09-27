
# Netflix Shows and Movies - Projeto de Banco de Dados SQL

## Visão Geral
Este projeto envolve a criação de um banco de dados SQL normalizado a partir de um conjunto de dados de séries e filmes da Netflix. O conjunto de dados original foi obtido no Kaggle: [Netflix Shows and Movies - Exploratory Analysis](https://www.kaggle.com/code/shivamb/netflix-shows-and-movies-exploratory-analysis/input).

O objetivo deste projeto é demonstrar habilidades de normalização de dados e criação de banco de dados SQL, transformando um arquivo CSV plano em um banco de dados SQL estruturado e normalizado.

## Estrutura do Banco de Dados
O banco de dados consiste em várias tabelas, cada uma representando um aspecto específico do conjunto de dados da Netflix. As tabelas foram normalizadas para reduzir a redundância e melhorar a integridade dos dados. A tabela final, `ALL_SHOW_INFO`, combina dados de todas essas tabelas para fornecer uma visão abrangente do conjunto de dados.

### Tabelas no Banco de Dados:
- `MOVIES`: Contém títulos de filmes e seus IDs.
- `DIRECTOR`: Armazena nomes de diretores e seus IDs.
- `CAST`: Lista membros do elenco e seus IDs.
- `MISC`: Inclui informações diversas, como país e tipo.
- `TIME_INFO`: Contém dados relacionados ao tempo, como data de adição e ano de lançamento.
- `RATING`: Armazena descrições de classificação e seus IDs.
- `LISTED_IN`: Lista gêneros/categorias e seus IDs.
- `MOVIE_DESCRIPTIONS`: Fornece descrições de séries e filmes.
- `MOVIE_INFO`: Contém informações adicionais sobre filmes, como duração.
- `DATA_RATING`: Vincula séries/filmes às suas classificações.
- `DATA_LISTED_IN`: Vincula séries/filmes aos seus gêneros/categorias.
- `CASTING`: Conecta séries/filmes a seus diretores e membros do elenco.

A tabela `ALL_SHOW_INFO` é uma tabela abrangente que combina dados de todas as tabelas mencionadas usando *joins* SQL. Inclui campos como ID da série, título, nome do diretor, membros do elenco, país, data de adição, ano de lançamento, descrição da classificação, duração, gênero, descrição e tipo.

## Instruções de Uso
1. **ALL_TOGETHER.sql**: Execute este arquivo primeiro para criar todo o banco de dados com todas as tabelas individuais.
2. **final_TABLE.sql**: Execute este arquivo para criar a tabela `ALL_SHOW_INFO`, que consolida todos os campos em uma única tabela.
3. **Database_queries.sql**: Este arquivo contém consultas para exibir as 100 principais linhas da tabela `ALL_SHOW_INFO`. Executar essas consultas mostrará que o banco de dados e a tabela final foram configurados corretamente.

Este README tem como objetivo fornecer um guia abrangente para entender e navegar pelo banco de dados criado a partir do conjunto de dados da Netflix. Cada etapa é crucial para a configuração correta e visualização dos dados no ambiente SQL.

O Diagrama de Entidade-Relacionamento (ERD) abaixo representa visualmente a estrutura e as interconexões das várias tabelas dentro do banco de dados. Este diagrama ilustra como os dados estão organizados e relacionados entre diferentes aspectos do conjunto de dados de séries e filmes da Netflix. (Assim que eu tiver tempo, vou combinar várias tabelas em uma única, como uma tabela `MOVIES`, que conteria `show_id`, título, descrição, duração, etc.)

![image](https://github.com/miniquinox/Netflix-Database-SQL/assets/63688331/d9f5a8b6-50ba-4197-b7a5-fb48fd73a552)

## Perguntas Potenciais de Negócio

Este banco de dados de séries e filmes da Netflix pode abordar vários problemas de negócios. Abaixo estão algumas perguntas potenciais de negócios e as consultas SQL correspondentes que podem fornecer insights:

### Desenvolvimento de Estratégia de Conteúdo
- **Problema**: Determinar quais gêneros ou tipos de conteúdo são mais populares para informar a aquisição ou produção de conteúdo futuro.
- **Consulta**: Analisar a distribuição de séries/filmes entre diferentes gêneros (`LISTED_IN`) e classificações (`RATING`) para identificar categorias populares.

### Análise de Mercado
- **Problema**: Entender a distribuição de conteúdo em diferentes países para ajustar estratégias de marketing.
- **Consulta**: Agregar o número de séries/filmes por país (`MISC.country_name`) para ver quais regiões têm mais conteúdo.

### Otimização do Tempo de Lançamento
- **Problema**: Identificar a melhor época do ano para lançar novos conteúdos.
- **Consulta**: Examinar tendências em `date_added` (de `TIME_INFO`) para ver quais meses ou estações historicamente tiveram mais lançamentos.

### Análise de Diretores e Elenco
- **Problema**: Encontrar combinações de diretores e elenco de sucesso para futuros projetos.
- **Consulta**: Analisar colaborações passadas entre diretores (`DIRECTOR`) e membros do elenco (`CAST`) que levaram a séries/filmes bem avaliados ou populares.

### Estudo de Preferências dos Espectadores
- **Problema**: Entender as preferências dos espectadores com base em dados históricos.
- **Consulta**: Correlacionar os gêneros (`LISTED_IN`) e classificações (`RATING`) de séries/filmes com seus anos de lançamento (`TIME_INFO.release_year`) para identificar tendências ao longo do tempo.

### Análise de Longevidade do Conteúdo
- **Problema**: Avaliar quais tipos de conteúdo permanecem relevantes ou populares por longos períodos.
- **Consulta**: Comparar o ano de lançamento (`TIME_INFO.release_year`) e a data de adição à plataforma (`TIME_INFO.date_added`) para determinar a longevidade do conteúdo.

### Estratégia de Localização
- **Problema**: Adaptar conteúdo e estratégias de marketing para países específicos.
- **Consulta**: Identificar os gêneros (`LISTED_IN`) e tipos (`MISC.type_name`) mais comuns de séries/filmes em países específicos (`MISC.country_name`).

### Alocação de Orçamento para Novas Produções
- **Problema**: Determinar quais tipos de conteúdo merecem maior investimento.
- **Consulta**: Avaliar a correlação entre os gêneros de conteúdo (`LISTED_IN`) e suas classificações/popularidade para alocar o orçamento de forma eficaz.

Essas consultas aproveitam os dados ricos disponíveis neste banco de dados de séries e filmes da Netflix para orientar a tomada de decisões em estratégia de conteúdo, marketing, produção e mais.
