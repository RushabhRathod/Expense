<?php


session_start();
error_reporting(0);
include('includes/dbconnection.php');

//code to get the enum labels
$ret=mysqli_query($con,"SELECT COLUMN_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'detsdb' AND TABLE_NAME = 'tblexpense' AND COLUMN_NAME = 'ExpenseCategory'");
if($ret) {
	$str = $ret->fetch_assoc()['COLUMN_TYPE'];
	$labels= array();
	for ($i = 0; $i < strlen($str); $i++){
		if( $str[$i] == "'" ) {
			$value = "";
			$i++;
			while( $str[$i] != "'") {
				$value .= $str[$i];
				$i++;
			}					
			array_push($labels, $value);
		}
	}	
} else {
	echo "error";
}

if (strlen($_SESSION['detsuid']==0)) {
  header('location:logout.php');
  } else{

if(isset($_POST['submit']))	{
	$userid=$_SESSION['detsuid'];
	$dateexpense=$_POST['dateexpense'];
	$item=$_POST['item'];
	$costitem=$_POST['costitem'];
	echo $_POST['expensecategory'];
	$result;
	if($_POST['expensecategory'] == "create") {
		$temp = "enum(";
		for($i = 0; $i < count($labels); $i++){
			$temp .= "'";
			$temp .= $labels[$i];
			$temp .= "',";
		}
		$temp .= "'";
		$temp .= strtoupper($_POST['categoryname']);
		$temp .= "')";
		$query = "ALTER TABLE `tblexpense` MODIFY COLUMN `ExpenseCategory` $temp";
		$result = mysqli_query($con, $query); 
		$expensecategory = strtoupper($_POST['categoryname']);
	}
	else {
		$expensecategory=$_POST['expensecategory'];
	}
	$result=mysqli_query($con, "insert into tblexpense(UserId,ExpenseDate,ExpenseItem,ExpenseCost,ExpenseCategory) value('$userid','$dateexpense','$item','$costitem', '$expensecategory')");
	if($result){
		echo "<script>alert('Expense has been added');</script>";
		echo "<script>window.location.href='manage-expense.php'</script>";
	} else {
		echo "<script>alert('Something went wrong. Please try again');</script>";
	}
	
}
  ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Daily Expense Tracker || Add Expense</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<script >
		function showHide() {
			var val = document.getElementById("dropdown").value;
			if(val == "create") {
				document.getElementById("newcat").style.display = "block";
			}else {
				document.getElementById("newcat").style.display = "none";
			}
		}
	</script>
</head>
<body>
	<?php include_once('includes/header.php');?>
	<?php include_once('includes/sidebar.php');?>
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Expense</li>
			</ol>
		</div><!--/.row-->
		
		
				
		
		<div class="row">
			<div class="col-lg-12">
			
				
				
				<div class="panel panel-default">
					<div class="panel-heading">Expense</div>
					<div class="panel-body">
						<p style="font-size:16px; color:red" align="center"> <?php if($msg){
    echo $msg;
  }  ?> </p>
						<div class="col-md-12">
							
							<form role="form" method="post" action="" novalidate>
								<div class="form-group">
									<label>Date of Expense</label>
									<input class="form-control" type="date" value="" name="dateexpense" required="true">
								</div>
								<div class="form-group">
									<label>Item</label>
									<input type="text" class="form-control" name="item" value="" required="true">
								</div>
								
								<div class="form-group">
									<label>Cost of Item</label>
									<input class="form-control" type="text" value="" required="true" name="costitem">
								</div>

								<!-- <div class="form-group">
									<label>Category of Expense</label>
									<input class="form-control" type="text" value="" required="true" name="expensecategory">
								</div> -->
								<div class="form-group">
  									<label>Category of Expense</label>
									  
									<select id="dropdown" class="form-control" type="text" required="true" name="expensecategory" onchange="showHide()">
										<?php
											for($i = 0; $i < count($labels); $i++) {
												echo "<option value=\"$labels[$i]\">$labels[$i]</option>";
											}
										?> 
										<option value="create">Create new category</option>
									</select>
											
								</div>

								<div class="form-group" style="display:none" name="newcat" id="newcat">
									<label>New Category Name</label>
									<input class="form-control" type="text" value="" required="true" name="categoryname">
								</div>

								<div class="form-group has-success">
									<button type="submit" class="btn btn-primary" name="submit">Add</button>
								</div>
								
								
								</div>
								
							</form>
						</div>
					</div>
				</div><!-- /.panel-->
			</div><!-- /.col-->
			<?php include_once('includes/footer.php');?>
		</div><!-- /.row -->
	</div><!--/.main-->
	
<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/custom.js"></script>
	
	
</body>
</html>
<?php echo $query;}  ?>