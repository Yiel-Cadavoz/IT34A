<?php
function logActivity($pdo,$user_id,$user_email,$action,$status='success'){
    try{
        // Get Client IP Address
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'] ?? $_SERVER['REMOTE_ADDR'] ?? 'Unknown';

        // String to Array
        if (strpos($ip,',') !== false){
            $ip = trim(explode(',', $ip)[0]);
        }

        // Get user agent (browser)
        $user_agent = substr($_SERVER['HTTP_USER_AGENT'] ?? 'Unknown',0,255);

        // Application query #1
        $stmt = $pdo->prepare("
        INSERT INTO activity_logs(
        user_id,
        user_email,
        activty_log_action,
        activty_log_status,
        activty_log_ip_address,
        activty_log_user_agent
        ) VALUES (?,?,?,?,?,?)
        ");

        //EXECUTE THE INSERT
        $success = $stmt->execute([
            $user_id,
            $user_email,
            $action,
            $status,
            $ip,
            $user_agent
        ]);

        return $success;

    } catch (PDOException $e) {
        error_log("Activty Log Error: " . $e->getMessage());
        return false;
    }
}

    if($success){
        echo "Activity log inserted successfully";
    } else {
        echo "Failed to insert activity log";
    }
?>