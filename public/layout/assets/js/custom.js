$(document).ready(function () {
    $('.cep').mask('00000-000');
    $('.data').mask('00/00/0000');
    $('.cpf').mask('000.000.000-00');
    $('.cpf-numeros').mask('00000000000');
    $('.cnpj').mask("00.000.000/0000-00");
    $('.telefone').mask("(00)00000-0000");
    $('.telefone_fixo').mask("(00)0000-0000");
    $('.numeros').mask('###000', { reverse: true });
    $('.vida-util-anos').mask("000", { reverse: true });
    $('.percentual-residual').mask("00%", { reverse: true });
    $('.latitude').mask('99.999999');
    $('.longitude').mask('-999.999999');
    $('.processo_sei').mask('0000.000000/0000-00');
    $('.ano').mask('0000');
    $('.data_competencia').mask('00-0000');
    $('.tanque').mask('000');
    $('.portas').mask('0');
    $('.passageiro').mask('000');
    $('.cref').mask('000000-A/AA');
    $('.inep').mask('00000000');
})