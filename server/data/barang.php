<?php
class Barang
{
    public $id;
    public $nmbarang;
    public $jumlah;

    private $conn;
    private $table = "data_barang";

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    function add()
    {
        $query = "INSERT INTO
                " . $this->table . "
            SET
               id=:id, nmbarang=:nmbarang, jumlah=:jumlah";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('nmbarang', $this->nmbarang);
        $stmt->bindParam('jumlah', $this->jumlah);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function delete()
    {
        $query = "DELETE FROM " . $this->table . " WHERE id = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function fetch()
    {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function get()
    {
        $query = "SELECT * FROM " . $this->table . " p          
                WHERE
                    p.id = ?
                LIMIT
                0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);

        $stmt->execute();

        $barang = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->id = $barang['id'];
        $this->nmbarang = $barang['nmnbarang'];
        $this->jumlah = $barang['nmbarang'];
    }

    function update()
    {
        $query = "UPDATE
                " . $this->table . "
            SET
                nmbarang = :nmbarang,
                jumlah = :jumlah,
            WHERE
                id = :id";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('nmbarang', $this->nmbarang);
        $stmt->bindParam('jumlah', $this->jumlah);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}