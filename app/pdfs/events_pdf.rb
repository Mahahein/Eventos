class EventsPdf < Prawn::Document

	def initialize(event, view)
		super()
		@event = event
		#@event = Event.find(@event_id)
		head_page
		info_event(@event)
	end

	def head_page()
		fill_color "A4A4A4"
		fill_rectangle [0,720], 540, 50
		font_size 20
		fill_color "000000"
		move_down 20
		text "Detalle de Evento", :align => :center
	end

	def info_event(evento)
		font_size 12
		move_down 40
		text "INFORMACION DEL EVENTO", :style => :bold
		move_down 20
		y_linea = cursor
		text "Nombre Evento:"
		bounding_box([150, y_linea], :width => 100, :height => 20) do
			text "#{evento.name}"
		end
		y_linea = cursor
		text "Cliente:"
		bounding_box([150, y_linea], :width => 100, :height => 20) do
			text "#{evento.customer.name}"
		end
		y_linea = cursor
		text "Fecha de Solicitud:"
		bounding_box([150, y_linea], :width => 100, :height => 20) do
			text "#{evento.date_request.strftime("%d/%m/%Y")}"
		end
		y_linea = cursor
		text "Fecha de Pedido:"
		bounding_box([150, y_linea], :width => 100, :height => 20) do
			text " #{evento.start_at.strftime("%d/%m/%Y")}"
		end
		y_linea = cursor
		text "Fecha de Recepcion:"
		bounding_box([150, y_linea], :width => 100, :height => 20) do
			text "#{evento.end_at.strftime("%d/%m/%Y")}"
		end
		y_linea = cursor
		text "Descuento:"
		bounding_box([150, y_linea], :width => 100, :height => 20) do
			text "#{evento.discount}%"
		end

		matriz = [["Producto","Cantidad", "Valor Unitario", "Total"]]

		evento.items.each do |item|
			fila =[]
			fila << item.product.name
			fila << item.quantity
			fila << "$ #{item.price}"
			fila << "$ #{item.price * item.quantity}"
			matriz << fila
		end
		move_down 40
		text "DETALLE DE PRODUCTOS", :style => :bold
		move_down 20
		table matriz, :width => 540, :row_colors => ["F0F0F0", "FFFFCC"]
		move_down 20
		y_linea = cursor
		if cursor < 100
			start_new_page
		end
		move_down 20
		y_linea = cursor
		bounding_box([400, y_linea], :width => 140, :height => 100) do
			font_size 14
			text "$#{evento.totalprice}", :align => :right
			text "$#{evento.totalprice * evento.discount/100}", :align => :right
			text "$#{evento.totaldiscount}", :align => :right
		end
		bounding_box([250, y_linea], :width => 150, :height => 100) do
			font_size 14
			text "Total sin Descuento", :align => :left
			text "Descuento", :align => :left
			text "Total Evento", :align => :left
		end
		
	end

	def foot_page()
		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end


end