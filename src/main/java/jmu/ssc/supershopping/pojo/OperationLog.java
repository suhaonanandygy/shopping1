package jmu.ssc.supershopping.pojo;

import java.sql.Timestamp;

public class OperationLog {
    private Long id;
    private Long userId;
    private String operationDescription;
    private Timestamp operationTime;
    private String ipAddress;
}
