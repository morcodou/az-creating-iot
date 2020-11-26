SELECT
    DeviceId=datapoints.iothub.connectionDeviceId,
    Sensorname,
    WindowEndTime =(System.Timestamp),
    AVG(Value),
    MIN(Value),
    MAX(Value)
INTO
    [YourOutputAlias]
FROM
    datapoints
    TIMESTAMP BY
        datapoints.iothub.enqueuedTime
GROUP BY
    datapoints.iothub.connectionDeviceId,
    Sensorname,
    TumblingWindow(second,15) -- grouping in fifteen second interval