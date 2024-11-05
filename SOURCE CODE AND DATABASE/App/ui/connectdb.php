<?php

try{

    $pdo = new PDO('mysql:host=127.0.0.1;dbname=producteurmanagement_db','root','');

}catch(PDOException $e  ){

echo $e->getMessage();

}

function sendlog(
  $pdo,
  $event_type,
  $event_description,
  $event_status,
  $event_actorID,
  $event_actorName,
  $event_subjectType,
  $event_subjectID,
  $event_subjectName
) {
  $insert = $pdo->prepare("INSERT INTO tbl_events (event_type, event_description, event_source_IP, event_source_UA, event_status, actor_id, actor_name, subject_type, subject_id, subject_name) VALUES (:type, :description, :sourceIP, :sourceUA, :status, :actorID, :actorName, :subjectType, :subjectID, :subjectName)");
  $insert->bindParam(':type', $event_type);
  $insert->bindParam(':description', $event_description);
  $insert->bindParam(':sourceIP', $_SERVER['REMOTE_ADDR']);
  $insert->bindParam(':sourceUA', $_SERVER['HTTP_USER_AGENT']);
  $insert->bindParam(':status', $event_status);

  $insert->bindParam(':actorID', $event_actorID);
  $insert->bindParam(':actorName', $event_actorName);
  $insert->bindParam(':subjectType', $event_subjectType);
  $insert->bindParam(':subjectID', $event_subjectID);
  $insert->bindParam(':subjectName', $event_subjectName);
  try {
    $insert->execute();
    return true;
  } catch (\Throwable $th) {
    return false;
  }
}

//echo'connection success';

?>