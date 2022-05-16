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
    'Sede social:Pinheiros, São Paulo',
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
    'Juanita Malita',
    'nitamalita@gmail.com',
    '1991-10-12',
    'https://randomuser.me/api/portraits/lego/1.jpg',
    'Motorista, eletricista, ortopedista e horista.',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Genesito Malito',
    'genemalito@google.com',
    '2000-11-01',
    'https://randomuser.me/api/portraits/lego/2.jpg',
    'Motorista, eletricista, ortopedista e horista.',
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
    'Educação do futuro, agora',
    '/img/articles/logo-capacete.jpg',
    '<p>A missão do instituto Ayton Senna é promover o potencial transformador das pessoas por meio do desenvolvimento integrado de alunos e educadores.
Colaboração, crença no potencial e respeito são a base do nosso trabalho.
Trabalham com educadores, administradores e pesquisadores para preparar crianças e adolescentes para toda a vida.</p><img src="/img/articles/F1.jpg" alt="Imagem aleátória"><p>A criação do instituto era o objetivo do piloto de Fórmula 1 Ayrton Senna, mas sua morte precoce acabou impedindo a mudança. No entanto, a ideia foi adotada pela família do piloto e uma ONG foi formada em 1994. O objetivo da agência é reduzir as desigualdades sociais por meio da educação de crianças e adolescentes. O instituto desenvolve soluções para educação de qualidade nas escolas públicas do Brasil e, a partir de parcerias com gestores públicos, educadores e outras organizações, traduz essas recomendações em políticas práticas que impactaram a aprendizagem de até 2 milhões de alunos. Pessoas todos os anos, em quase todos os estados do Brasil.</p>',
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
    'É assim que se faz isso',
    'Aprenda como fazer para apreder o que fazer, sabendo o que fazer.',
    '/img/articles/4.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="https://picsum.photos/400/300" alt="Imagem aleátória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '2'
),
(
    'A arte de fazer sem que se faça',
    'Dessa forma que fazermos aquilo que deve ser feito sem que seja necessário fazer.',
    '/img/articles/5.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="https://picsum.photos/400/300" alt="Imagem aleátória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '2'
),
(
    'Cortes cortados de cantos arredondados',
    'Neste artigo aprenderemos a fazer cantos de cortes cortados.',
    '/img/articles/6.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="https://picsum.photos/400/300" alt="Imagem aleátória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '2'
);