module ApplicationHelper
  include Pagy::Frontend
  def pagy_navigation(pagy)
    pagy_bootstrap_nav_class = "col-12 col-md mb-md-0 mb-2 d-flex justify-content-md-start justify-content-center"
    pagy_info_class = "col-12 col-md text-center text-md-end text-muted align-items-center"

    content_tag(:div, class: "row") do
      safe_join([
        content_tag(:div, pagy_bootstrap_nav(pagy).html_safe, class: pagy_bootstrap_nav_class),
        content_tag(:div, pagy_info(pagy).html_safe, class: pagy_info_class)
      ])
    end
  end

  def btn_submit(form, value: nil, target: nil, path: nil)
    text = value || (form.object.new_record? ? "Incluir" : "Atualizar")

    button_tag(type: "submit", class: "btn btn-primary") do
      safe_join([ text, content_tag(:i, "") ])
    end
  end

  def translate_concat(*keys, separator: " ")
    keys.map { |key| t(key) }.join(separator).html_safe
  end

  def formatar_data(data)
    return unless data.present?

    formato = "%d/%m/%Y"

    case data
    when Date
      data.strftime(formato)
    when String
      Date.strptime(data, formato).strftime(formato) if data.match(/\A\d{2}\/\d{2}\/\d{4}\z/)
    end
  end

  def formatar_data_ano(ano)
    return nil if ano.blank?
    ano.to_s if ano.is_a?(Integer) && ano.to_s.length == 4 # Verifica se é um inteiro e tem 4 dígitos
  end

  def formatar_data_hora(datetime)
    datetime_obj = datetime.is_a?(String) ? DateTime.parse(datetime) : datetime
    datetime_formatado = datetime_obj.strftime("%d/%m/%Y %H:%M:%S")
    datetime_formatado
  end

  def formatar_real(value)
    value.present? ? number_to_currency(value, unit: "", separator: ",", delimiter: ".") : "0,00"
  end

  def formatar_cpf(cpf)
    cpf.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4') if cpf
  end

  def formatar_cep(cep)
    cep.gsub(/(\d{5})(\d{3})/, '\1-\2') if cep
  end

  def formatar_boolean(value)
    if value
      '<span class="badge bg-success bg-opacity-20 text-success ms-2">Sim</span>'.html_safe
    elsif value == false
      '<span class="badge bg-danger bg-opacity-20 text-danger ms-2">Não</span>'.html_safe
    else
      '<span class="badge bg-danger bg-opacity-20 text-danger ms-2">Indefinido</span>'.html_safe
    end
  end

  def nav_link_controller(controller)
    "nav-link #{'active' if params[:controller] == controller}"
  end
end
