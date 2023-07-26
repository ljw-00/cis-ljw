<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title></title>
<style>
    h1 {
      text-align: center;
      margin-top: 20px;
    }
    table tr td {
      cursor: pointer;
    }
</style>
</head>
<body>
    <div>
      <h1>고객의견</h1>
    </div>
    <div class="container-md">    
      <table class="table table-hover table-bordered">
        <thead>
          <tr class="table-active">
            <th scope="col">#</th>
            <th scope="col">First</th>
            <th scope="col">Last</th>
            <th scope="col">Handle</th>
          </tr>
        </thead>
        <tbody>
          <tr id="row1" userId="ljw" seq="1">
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>Larry the Bird</td>
            <td>Thornton</td> 
            <td>@twitter</td>
          </tr>
        </tbody>
      </table>
    </div>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
(()=>{   
    const row1 = document.querySelector('#row1');
    row1.addEventListener('click', ()=>{
      console.log(row1.getAttribute('userId'));
      console.log(row1.getAttribute('seq'));
    });
})(); 
</script>
        
</body>