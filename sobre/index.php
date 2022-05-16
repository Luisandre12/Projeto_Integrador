<?php

/**
 * Arquivo que faz a configuração incial da página.
 * Por exemplo, conecta-se ao banco de dados.
 * 
 * A superglobal "$_SERVER['DOCUMENT_ROOT']" retorna o caminho da raiz do site no Windows.
 * Ex.: C:\xampp\htdocs 
 *     Referências:
 *     → https://www.w3schools.com/php/php_includes.asp
 *     → https://www.php.net/manual/pt_BR/function.include.php
 *     → https://www.php.net/manual/pt_BR/language.variables.superglobals.php
 */
require($_SERVER['DOCUMENT_ROOT'] . '/_config.php');

/***********************************************
 * Seus códigos PHP desta página iniciam aqui! *
 ***********************************************/


/************************************************
 * Seus códigos PHP desta página terminam aqui! *
 ************************************************/

/**
 * Variável que define o título desta página.
 * Essa variável é usada no arquivo "_header.php".
 * OBS: para a página inicial (index.php) usaremos o 'slogan' do site.
 *     Referências:
 *     → https://www.w3schools.com/php/php_variables.asp
 *     → https://www.php.net/manual/pt_BR/language.variables.basics.php
 */
$title = "Quem tem fome tem pressa...";

/**
 * Inclui o cabeçalho da página.
 */
require($_SERVER['DOCUMENT_ROOT'] . '/_header.php');

?>

<section>

    <h2>Título da página</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum, iste aliquam aperiam voluptatem molestias nemo odit unde modi cupiditate exercitationem doloremque quaerat soluta rerum quidem dignissimos officiis sapiente, aut alias!</p>
    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Optio soluta voluptatum consequatur voluptatibus cupiditate temporibus qui, nostrum deserunt minus laudantium in officia rem dignissimos facilis modi culpa error aliquam? Quam?</p>

</section>

<aside>
<div class="author-meta">

<h2>Criadores do site</h2>
<h3><strong>Luis André e João Pedro</strong></h3>
<ul>
    
    <li>Email(Luis):luisandreferreira2011@gmail.com</li>
    <li>Email(João):fernandesjoaopedro526@gmail.com</li>
    <li>Github(Luis):<a href="https://github.com/Luisandre12" target="_blank"> luisandre12</a></li>
    <li>Github(João):<a href="https://github.com/JoaoPedro16o" target="_blank"> JoaoPedro16o</a></li>
    <li>Estudantes do curso Técnico em informatica</li>
    <li>Senac Unidade Madureira</li>
</ul>

</div>
</aside>

<?php

/**
 * Inclui o rodapé da página.
 */
require($_SERVER['DOCUMENT_ROOT'] . '/_footer.php');
