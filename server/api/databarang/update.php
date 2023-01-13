<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: PUT');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/barang.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$barang = new Barang($conn);

$data = json_decode(file_get_contents("php://input"));

$barang->id = $data->id;

$response = [];

if ($request == 'PUT') {
    if (
        !empty($data->id) &&
        !empty($data->nmbarang) &&
        !empty($data->jumlah)
    ) {
        $barang->id = $data->id;
        $barang->nmbarang = $data->nmbarang;
        $barang->jumlah = $data->jumlah;

        $data = array(
            'id' => $barang->id,
            'nmbarang' => $barang->nmbarang,
            'jumlah' => $barang->jumlah,
        );

        if ($barang->update()) {
            $response = array(
                'status' =>  array(
                    'messsage' => 'Success', 'code' => (http_response_code(200))
                ), 'data' => $data
            );
        } else {
            http_response_code(400);
            $response = array(
                'messsage' => 'Update Failed',
                'code' => http_response_code()
            );
        }
    } else {
        http_response_code(400);
        $response = array(
            'status' =>  array(
                'messsage' => 'Update Failed - Wrong Parameter', 'code' => http_response_code()
            )
        );
    }
} else {
    http_response_code(405);
    $response = array(
        'status' =>  array(
            'messsage' => 'Method Not Allowed', 'code' => http_response_code()
        )
    );
}

echo json_encode($response);
