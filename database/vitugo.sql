-- Apaga o banco de dados caso exista.
DROP DATABASE IF EXISTS vitugo;

-- Cria o banco de dados
CREATE DATABASE vitugo CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona banco de dados.
USE vitugo; 

-- Cria tabela de usuários/autores.
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(255),
    user_email VARCHAR(255),
    user_birth DATE,
    user_photo VARCHAR(255),
    user_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_profile TEXT,
    user_password VARCHAR(255),
    user_type ENUM('user', 'author', 'admin') DEFAULT 'user',
    user_status ENUM('on', 'off', 'deleted') DEFAULT 'on'
);

-- Cria tabela de artigos
CREATE TABLE articles (
    art_id INT PRIMARY KEY AUTO_INCREMENT,
    art_title VARCHAR(127),
    art_intro VARCHAR(255),
    art_thumb VARCHAR(255),
    art_content TEXT,
    art_author INT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_status ENUM('on', 'off', 'deleted') DEFAULT 'on',
    FOREIGN KEY (art_author) REFERENCES users (user_id)
);

-- Cria tabela de comentários nos artigos
CREATE TABLE comments (
    cmt_id INT PRIMARY KEY AUTO_INCREMENT,
    cmt_article INT,
    cmt_author INT,
    cmt_comment TEXT,
    cmt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cmt_status ENUM('on', 'off', 'deleted') DEFAULT 'on',
    FOREIGN KEY (cmt_article) REFERENCES articles (art_id),
    FOREIGN KEY (cmt_author) REFERENCES users (user_id)
);

-- Cria tabela com contatos do site
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(127),
    email VARCHAR(255),
    subject VARCHAR(255),
    message TEXT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('on', 'off', 'deleted') DEFAULT 'on'
);

-- Insere dados em 'users'
INSERT INTO users (
    user_name,
    user_email,
    user_birth,
    user_photo,
    user_profile,
    user_password,
    user_type
) VALUES 
(
    'Instituto Ayrton Senna',
    'institutoayrtonsenna@gmail.com',
    '1994-11-20',
    '/img/articles/logo-B.jpg',
    'Sede social:Pinheiros, São Paulo.',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Emegarda Sirineuza',
    'emen@siri.com',
    '2000-01-11',
    'https://randomuser.me/api/portraits/lego/3.jpg',
    'Cantora, compositora, arranjadora, arrumadora e operadora.',
    SHA1('Qw3rtyui0P'),
    'user'
),
(
    'Eletricildo Chocante',
    'eletro@choque.com',
    '1981-05-02',
    'https://randomuser.me/api/portraits/lego/5.jpg',
    'Motorista, eletricista, ortopedista e horista.',
    SHA1('Qw3rtyui0P'),
    'admin'
),
(
    'Instituto 5 Elementos',
    'comunicacao@5elementos.org.br',
    '1993-01-01',
    '/img/articles/aa.png',
    'Sede social:São Paulo, SP.',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Projeto Uerê',
    'genemalito@google.com',
    '2000-11-01',
    'https://randomuser.me/api/portraits/lego/2.jpg',
    'Motorista, eletricista, ortopedista e horista.',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Cidadão Pró-Mundo',
    'comunicacao@cidadaopromundo.org.',
    '1997-01-01',
    '/img/articles/5a5bd129447d7.jpg',
    'R. Pref. Passos, 95 - Vila Itapura, Campinas - SP.',
    SHA1('Qw3rtyui0P'),
    'author'
);

-- Insere dados em 'articles'
INSERT INTO articles (
    art_title,
    art_intro,
    art_thumb,
    art_content,
    art_author
) VALUES
(
    'Instituto Ayrton Senna',
    'Educação do futuro, agora.',
    '/img/articles/capa.jpg',
    '<p>A missão do instituto Ayton Senna é promover o potencial transformador das pessoas por meio do desenvolvimento integrado de alunos e educadores.
Colaboração, crença no potencial e respeito são a base do nosso trabalho.
Trabalham com educadores, administradores e pesquisadores para preparar crianças e adolescentes para toda a vida.</p><img src="/img/articles/aaaa.jpg" alt="Imagem aleátória"><p>A criação do instituto era o objetivo do piloto de Fórmula 1 Ayrton Senna, mas sua morte precoce acabou impedindo a mudança. No entanto, a ideia foi adotada pela família do piloto e uma ONG foi formada em 1994. O objetivo da agência é reduzir as desigualdades sociais por meio da educação de crianças e adolescentes. O instituto desenvolve soluções para educação de qualidade nas escolas públicas do Brasil e, a partir de parcerias com gestores públicos, educadores e outras organizações, traduz essas recomendações em políticas práticas que impactaram a aprendizagem de até 2 milhões de alunos. Pessoas todos os anos, em quase todos os estados do Brasil.</p>',
    '1'
),
(
    'Veja como isso é feito',
    'Aprenda a fazer da forma certa o que você sempre fez errado.',
    '/img/articles/2.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="https://picsum.photos/400/300" alt="Imagem aleátória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '2'
),
(
    'Comprando o que não pode ser vendido',
    'Neste artigo aprenderemos a fazer uma coisa que ninguém faz.',
    '/img/articles/3.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="https://picsum.photos/400/300" alt="Imagem aleátória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '2'
);

-- Insere dados em 'articles'
INSERT INTO articles (
    art_title,
    art_intro,
    art_thumb,
    art_content,
    art_author
) VALUES
(
    'Instituto 5 Elementos',
    ' Educação para a Sustentabilidade.',
    '/img/articles/logo.jpg',
    '<p> O 5 Elementoso é pioneira com 30 anos de história, cuja credibilidade foi construída a partir de projetos, programas e publicações de referência nas temáticas socioambientais.</p><p>Integramos redes de Educação Ambiental,Fóruns, Conselhos, Comitês e Alianças que compartilham dos princípios e objetivos da Carta da Terra, das Políticas Públicas de Educação Ambiental articulando novas parcerias.</p><img src="/img/articles/bbb.jpg" alt="Imagem aleátória"><p>5 Elementos – Instituto de Educação para o Desenvolvimento Sustentável, Organização da Sociedade Civil de Interesse Público (OSCIP) fundada por mulheres em São Paulo em 1993 para divulgar ideias e práticas educacionais voltadas para o desenvolvimento sustentável.</p><p>
Trabalhamos com e para crianças, jovens, grupos de mulheres, professores, educadores e organizações da sociedade civil, públicas e privadas, para construir projetos e soluções que orientem a consolidação de uma sociedade mais justa e de desenvolvimento sustentável Objetivos – Agenda ODS 2030</p>',
'4'
),
(
    'Projeto Uerê',
    'NÓS ACREDITAMOS QUE TODOS SÃO CAPAZES DE APRENDER.',
    '/img/articles/5.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="https://picsum.photos/400/300" alt="Imagem aleátória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '2'
),
(
    'Cidadão Pró-Mundo',
    'Ensinar inglês e transformar a sociedade.',
    '/img/articles/5a5bd129447d7.jpg',
    '<p>O Cidadão Pró-Mundo tem como objetivo proporcionar oportunidades educacionais para jovens e adultos em comunidades carentes, e sua missão é promover oportunidades de inclusão e inclusão na sociedade brasileira por meio do ensino de inglês.</p><p>A Cidadão Pró-Mundo foi reconhecida como uma das 100 melhores ONGs do Brasil por sua estrutura administrativa, operacional e de governança altamente organizada e o mais moderno modelo corporativo, selecionada como a melhor ONG educacional do Brasil 2020, sendo considerada a maior e mais bem estruturada ONG de ensino de inglês que atua no Brasil.</p><img src="/img/articles/foto_TC.PNG-500x300.png" alt="Imagem aleátória"><p>Após 25 anos de atuação e contando com uma metodologia inovadora de voluntariado e ensino, atualmente a CPM conta com cerca de 1.400 voluntários, entre professores e equipe administrativa, além de uma equipe contratada dedicada às áreas estratégicas da ONG (Comunicação, Financeiro,  Operações e Pedagógico), todos mobilizados para atender a seus mais de 2.500 beneficiários: alunos que assistem ao curso de inglês em uma de nossas 12 Unidades de Ensino.</p>',
    '6'
);