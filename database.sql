CREATE TABLE IF NOT EXISTS Categorias(
  id_categoria INT NOT NULL AUTO_INCREMENT,
  categoria VARCHAR(45),
  PRIMARY KEY(id_categoria)
);

CREATE TABLE IF NOT EXISTS Productos(
  id_producto INT NOT NULL AUTO_INCREMENT,
  producto  VARCHAR(45),
  precio FLOAT,
  stock INT,
  descripcion VARCHAR(140),
  imagen VARCHAR(150),
  categoria INT,
  PRIMARY KEY(id_producto),
  FOREIGN KEY(categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE IF NOT EXISTS Clientes(
  id_cliente INT NOT NULL AUTO_INCREMENT,
  cliente VARCHAR(140),
  calle VARCHAR(50),
  numero VARCHAR(10),
  colonia VARCHAR(25),
  estado VARCHAR(25),
  numero_tarjeta VARCHAR(16),
  PRIMARY KEY(id_cliente)
);

CREATE TABLE IF NOT EXISTS Ticket(
  id_ticket INT NOT NULL AUTO_INCREMENT,
  fecha TIMESTAMP NOT NULL DEFAULT NOW(),
  cliente INT,
  PRIMARY KEY(id_ticket),
  FOREIGN KEY(cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE IF NOT EXISTS Ventas(
  id_venta INT NOT NULL AUTO_INCREMENT,
  producto INT,
  ticket INT,
  PRIMARY KEY(id_venta),
  FOREIGN KEY(producto) REFERENCES Productos(id_producto),
  FOREIGN KEY(ticket) REFERENCES Ticket(id_ticket)
);

<div class="item" id="item">
          <div class="item-row-multimedia">
            <div class="item-img">
              <img src="img/coca.png" height="192" width="192"/>
            </div>
            <div class="item-text">
              <p>coca</p>
              <p>ñsdkñajñsldjf</p>
              <p>asd</p>
            </div>
          </div>
          <div class="item-row-button">
            <div class="item-button">Agregar a carrito</div>
          </div>
        </div>

        <div class="row">
        <div class="item" id="item">
          <div class="item-img">
            <img src="img/coca.png"/>
          </div>
          <div class="item-text">
            <h3>Coca</h3>
            asd <br/>
            asd <br/>
          </div>
          <div class="item-row-button">
            <div class="item-button">Agregar a carrito</div>
          </div>
        </div>
      </div>