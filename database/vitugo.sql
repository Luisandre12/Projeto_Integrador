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
    art_views INT DEFAULT '0',
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
    'Setembrino Trocatapas',
    'set@brino.com',
    '1990-10-14',
    'https://randomuser.me/api/portraits/lego/6.jpg',
    'Programador, agricultor, enrolador, fazedor de nada.',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Vagalume',
    'falecom@vagalume.org.br',
    '2002-01-11',
    '/img/articles/art 02.png',
    'Rua Aspicuelta, 678, Vila Madalena 05433-011 - São Paulo - SP',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Amigos do Bem',
    'informacoes@amigosdobem.org',
    '1993-05-02',
    '/img/articles/Amigosdobemperfil.jfif',
    'Rua Dr. Gabriel de Resende, 122 03350-005 • São Paulo • SP.',
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
    'Avante',
    'avante@avante.org.br',
    '1991-11-01',
    '/img/articles/Avanteperfil.png',
    'Rua Almirante Barroso, nº 64, Rio Vermelho, Salvador/ BA, CEP: 41.950-355.',
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
    'Primeiro artigo',
    'Como fazer alguma coisa que você não sabe fazer.',
    '/img/articles/1.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="https://picsum.photos/400/300" alt="Imagem aleátória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '1'
),
(
    'Vagalume',
    'Torne-se um vaga-lume, contribua mensalmente com a nossa organização.',
    '/img/articles/Vagalume.png',
    '<p>Sylvia, Laís e Fofa queriam conhecer mais sobre o país em que viviam e, por isso, escolheram ir para a maior região do Brasil: a Amazônia Legal brasileira, que ocupa 60% do nosso território. Mas elas não queriam ir, aprender, conhecer e não deixar algo para quem elas conheceriam no caminho. Queriam trocar, aprender e ensinar, e foi aí que tiveram a ideia de levar livros e formar mediadores de leitura pelos lugares onde passassem.</p>
    <p>Então, em 2001, as três amigas partiram para implementar um projeto piloto em municípios do Pará. A ação foi tão bem aceita pelas comunidades que, em 2002, elas fizeram uma viagem de dez meses por todos os estados da Amazônia Legal brasileira, levando livros e formações por 53 comunidades rurais.</p><img src="/img/articles/Vagalumethumb.jpg" alt="Vagalume thumb">
    <p>Quando voltaram para São Paulo, onde ficava a pequena sala que haviam alugado para ser o escritório desse projeto, elas encontraram muitas cartas pedindo para que voltassem, pois havia muitas outras comunidades querendo bibliotecas e pessoas querendo formações, e foi assim que nasceu a Vaga Lume!</p>',
    '2'
),
(
    'AMIGOS DO BEM',
    'Se não posso fazer tudo o que devo, devo, ao menos, fazer tudo o que posso!.',
    '/img/articles/Amigosdobem.png',
    '<p>O nosso trabalho começou em 1993, com um pequeno grupo de amigos, liderado por Alcione Albanesi. Hoje, somos um dos maiores projetos sociais do país e atendemos, regularmente, a mais de 150 mil pessoas no sertão de Alagoas, de Pernambuco e do Ceará.</p>
    <p>Promovemos a transformação de milhares de vidas por meio de projetos contínuos de educação, geração de renda e acesso à água, moradia e saúde. Estamos rompendo um ciclo secular de miséria no sertão. Com oportunidades, mais de 10 mil crianças e jovens já enxergam um futuro diferente.</p><img src="/img/articles/Amigosdobemthumb.png" alt="Amigos do bem thumb">',
    '3'
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
    '4'
),
(
    'Avante',
    'O Olhar do Adolescente focalizando a escola.',
    '/img/articles/Avante.png',
    '<p>A instituição nasceu do sonho de um grupo de profissionais liderados por Ana Luiza Buratto e Maria Thereza Marcílio, de contribuir para a construção de uma sociedade mais justa e solidária, calcada no diálogo, na diversidade e na valorização do coletivo. Por meio da consolidação e conquista de parcerias, vem realizando ações de reconhecimento e valorização da escola pública, fortalecimento à empreendimentos solidários, articulação e formação de conselheiros de direito e escuta e participação política de crianças.</p>
    <p>A Avante atua desde 1991, mas foi em 1996 que a instituição organizou-se como uma OSC, sob forma de associação, levada por sua vocação natural para a realização de projetos de caráter social, tais como: ações formativas para redes, escolas e empresas, com vistas à construção de uma cidadania ativa. Seu primeiro grande desafio foi a coordenação do Prêmio Fundação Odebrecht/UNICEF 95: O Adolescente por uma Escola Melhor – sua primeira atuação de abrangência nacional, tendo a escola como foco. O projeto rendeu à Fundação Odebrecht o Prêmio Eco e deu origem ao livro: “O Olhar do Adolescente focalizando a escola”.</p><img src="/img/articles/Avantethumb.png" alt="Imagem Avante">
    <p>Ao longo de mais de 25 anos a instituição firmou-se como uma organização reconhecida em suas áreas de atuação e por sua colaborar na divulgação e consolidação dos marcos legais da Educação brasileira, e com a defesa de direitos e na construção de uma sociedade mais equânime.</p>',
    '5'
),
(
    'Cortes cortados de cantos arredondados',
    'Neste artigo aprenderemos a fazer cantos de cortes cortados.',
    '/img/articles/6.jpg',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto fugiat, nesciunt iure porro aliquid id consequuntur nisi placeat assumenda vero magni repellendus possimus corporis sed, quaerat totam? Veniam, pariatur ex?</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore sunt quo nam commodi repudiandae voluptas excepturi est aut iste veniam. Itaque possimus ullam eius quaerat? Quam aliquam eius corporis ut!</p><img src="https://picsum.photos/400/300" alt="Imagem aleátória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad quisquam amet, sunt, magnam debitis aliquam voluptates eius veniam explicabo molestias enim illo quam exercitationem ducimus vel eos eligendi aut libero.</p><ul><li><a href="https://guithub.com/Luferat">GitHub do Fessô</a></li><li><a href="http://catabits.com.br">Blog do Fessô</a></li><li><a href="https://bit.ly/LuferatMeet">Google Meet do Fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At itaque deserunt perferendis sit voluptatum sunt, minus labore ratione modi nesciunt distinctio temporibus amet omnis sapiente, dicta repudiandae ipsum, eaque deleniti!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptas quos quasi quis pariatur iure officia ab, eius beatae, fuga, in dolores neque possimus necessitatibus nostrum nulla expedita tempore harum tenetur?</p>',
    '4'
);