$(document).ready(function () {

  $('.keyup').keyup(function () {
    $(this).val($(this).val().toUpperCase());
  });

  $('.downcase').keyup(function () {
    $(this).val($(this).val().toLowerCase());
  });

  $('.letra_sistema').mask('Z', {
    translation: {
      'Z': {
        pattern: /[a-zA-Z]/, optional: false
      }
    }
  });

  $('.uf').mask('ZZ', {
    translation: {
      'Z': {
        pattern: /[a-zA-Z]/, optional: false
      }
    }
  });

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


  $('form').submit(function () {
    var cpfField = $('.cpf'); // Seleciona o campo CPF
    var cpfValue = cpfField.val(); // Obtém o valor do campo

    // Verifica se o CPF tem algum valor antes de processar
    if (cpfValue && cpfValue.trim() !== "") {
      // Remove a formatação da máscara (deixa apenas números)
      var cpfSemMascara = cpfValue.replace(/\D/g, '');
      cpfField.val(cpfSemMascara);
    }
  });

  $('.coordenada').mask('-999.999999', {
    translation: {
      '9': {
        pattern: /[0-9]/,
        optional: true
      }
    }
  });

  $('.percentual-float').mask('00,00%', { reverse: true });

  var DateTimePickers = function () {
    const _componentDaterange = function () {
      if (!$().daterangepicker) {
        console.warn('Aviso - daterangepicker.js não está carregado.');
        return;
      }

      $('.daterange-single').daterangepicker({
        parentEl: '.content-inner',
        singleDatePicker: true,
        locale: {
          format: "dd/mm/yyyy",
          daysOfWeek: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'],
          monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
          firstDay: 0 // Domingo como primeiro dia da semana
        }
      });
    }

    return {
      init: function () {
        _componentDaterange();
      }
    }
  }();

  document.addEventListener('DOMContentLoaded', function () {
    DateTimePickers.init();
  });

  $(document).on("click", "[data-confirm-delete]", function (event) {
    event.preventDefault();

    const form = $(this).closest("form");
    const confirmMessage = $(this).attr("data-confirm-message") || "Esta ação não pode ser desfeita.";

    Swal.fire({
      title: 'Tem certeza?',
      text: confirmMessage,
      icon: 'warning',
      showCancelButton: true,
      customClass: {
        confirmButton: "btn btn-danger",
        cancelButton: "btn btn-success"
      },
      confirmButtonText: 'Sim, tenho certeza!',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        form.submit(); 
      }
    });
  });
});

