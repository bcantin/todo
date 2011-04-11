module FaceboxRenderHelper

  def facebox_link_to(name, options = {}, html_options = nil)  
    # link_to_function(name, "jQuery.facebox(function(){ #{remote_function(options)} })", html_options || options.delete(:html))
    link_to_function(name, "jQuery.facebox(function(){ jQuery.ajax({data:'authenticity_token=' + encodeURIComponent('D4Lw+bKEg/qpKuMk0yCM7skarKDvZhOUtLc3xLqI3cs='), dataType:'script', type:'#{options[:method]}', url:'#{options[:url]}'}) })", html_options || options.delete(:html))
  end

end