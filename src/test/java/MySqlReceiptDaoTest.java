import dao.DAO;
import exceptions.DbExceptions;
import mysql.ConnectionPool;
import org.junit.jupiter.api.Test;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import util.SqlUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class MySqlReceiptDaoTest {

    ResultSet resultSet = Mockito.mock(ResultSet.class);
    PreparedStatement preparedStatement = Mockito.mock(PreparedStatement.class);
    Connection connection = Mockito.mock(Connection.class);
    ConnectionPool connectionPool = Mockito.mock(ConnectionPool.class);

    @Test
    public void getClientOrders() throws SQLException, DbExceptions {
        Mockito.when(resultSet.next()).thenReturn(true).thenReturn(true).thenReturn(false);
        Mockito.when(preparedStatement.executeQuery()).thenReturn(resultSet);
        Mockito.when(connection.prepareStatement(SqlUtils.GET_ALL_CLIENT_ORDERS)).thenReturn(preparedStatement);
        Mockito.when(connection.prepareStatement(SqlUtils.GET_DISHES_BY_ORDER_INDEX)).thenReturn(preparedStatement);
        Mockito.when(connectionPool.getConnection()).thenReturn(connection);
        try (MockedStatic<ConnectionPool> cpMock = Mockito.mockStatic(ConnectionPool.class)) {
            cpMock.when(ConnectionPool::getInstance).thenReturn(connectionPool);

            DAO.getDao().getOrderDao().getAllClientOrder(1);
        }
    }

    @Test
    public void getAllReceipts() throws SQLException, DbExceptions {
        Mockito.when(resultSet.next()).thenReturn(true).thenReturn(true).thenReturn(false);
        Mockito.when(preparedStatement.executeQuery()).thenReturn(resultSet);
        Mockito.when(connection.prepareStatement(SqlUtils.GET_ALL_ORDERS)).thenReturn(preparedStatement);
        Mockito.when(connection.prepareStatement(SqlUtils.GET_DISHES_BY_ORDER_INDEX)).thenReturn(preparedStatement);
        Mockito.when(connectionPool.getConnection()).thenReturn(connection);
        try (MockedStatic<ConnectionPool> cpMock = Mockito.mockStatic(ConnectionPool.class)) {
            cpMock.when(ConnectionPool::getInstance).thenReturn(connectionPool);

            DAO.getDao().getOrderDao().getAllOrders();
        }
    }

//    @Test
//    void getAllReceiptsAcceptedBy() throws SQLException, DbExceptions {
//        Mockito.when(resultSet.next()).thenReturn(true).thenReturn(true).thenReturn(false);
//        Mockito.when(preparedStatement.executeQuery()).thenReturn(resultSet);
//        Mockito.when(connection.prepareStatement(SqlUtils.GET_RECEIPTS_APPROVED_BY)).thenReturn(preparedStatement);
//        Mockito.when(connection.prepareStatement(SqlUtils.GET_RECEIPT_DISHES)).thenReturn(preparedStatement);
//        Mockito.when(connectionPool.getConnection()).thenReturn(connection);
//        try (MockedStatic<ConnectionPool> cpMock = Mockito.mockStatic(ConnectionPool.class)) {
//            cpMock.when(ConnectionPool::getInstance).thenReturn(connectionPool);
//
//            List<Receipt> receiptList = Dao.getDao().getReceiptDao().getAllReceiptsAcceptedBy(1);
//            receiptList.forEach(System.out::println);
//        }
//    }
}