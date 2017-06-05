package jspclass;

//import Models.AccountModel;
//import Models.FavoritePaymentModel;
//import Models.PaymentModel;
import com.google.gson.Gson;
import com.google.gson.JsonParseException;
import models.Film;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import values.Const;

import java.io.IOException;

public class Requester {

    public Requester() {}

    public Requester(String title, int cost) {
    }

    public String getAccount(String login, String password) {
        HttpClient httpClient = new HttpClient();
        PostMethod postMethod = new PostMethod(Const.SERVER_ADDR + "/server/rest/loginweb");


        postMethod.addParameter(new NameValuePair("login", login));
        postMethod.addParameter(new NameValuePair("password",password));
//        postMethod.addParameter(new NameValuePair("password", password));

        try {
            httpClient.executeMethod(postMethod);
            return postMethod.getResponseBodyAsString();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "null";
    }


//    public String add(String accountId, String title, int cost, String type) {
//        String uri = "";
//        String body = "";
//        switch (type) {
//            case "payment":
//                uri = Const.URI_PAYMENT_ACCOUNTS + accountId + "/payments";
//                PaymentModel paymentModel = new PaymentModel();
//                paymentModel.setPaymentCost(cost);
//                paymentModel.setPaymentDate(new Date().getTime());
//                paymentModel.setTitle(title);
//                paymentModel.setAccountId(Long.valueOf(accountId));
//                body = new Gson().toJson(paymentModel);
//                break;
//            case "favorite":
//                uri = Const.URI_PAYMENT_ACCOUNTS + accountId + "/favorites";
//                FavoritePaymentModel favoritePaymentModel = new FavoritePaymentModel();
//                favoritePaymentModel.setAccountId(Long.valueOf(accountId));
//                favoritePaymentModel.setTitle(title);
//                favoritePaymentModel.setCost(cost);
//                body = new Gson().toJson(favoritePaymentModel);
//                break;
//        }
//
//        HttpClient httpClient = new HttpClient();
//        PostMethod postMethod = new PostMethod(uri);
//        postMethod.addRequestHeader("Content-Type", "application/json;charset=UTF-8");
//        postMethod.setRequestBody(body);
//        try {
//            httpClient.executeMethod(postMethod);
//            return "Платёж " + title + " создан.";
//        } catch (IOException e) {
//            e.printStackTrace();
//            return "Платёж " + title + " не создан.";
//        }
//    }

    public Film[] getAllFilms() {
        String result = "";
        HttpClient httpClient = new HttpClient();
        GetMethod getMethod = new GetMethod(Const.SERVER_ADDR + "/server/rest/allfilms");
        Film[] films = null;
        try {
            httpClient.executeMethod(getMethod);
            try {
                String body = getMethod.getResponseBodyAsString();
                films = new Gson().fromJson(body, Film[].class);
            } catch (JsonParseException e) {
                e.printStackTrace();
                films = new Film[]{};
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return films;
    }

    public Film[] getWatched(Long accountId) {
        String result = "";
        HttpClient httpClient = new HttpClient();
        GetMethod getMethod = new GetMethod(Const.SERVER_ADDR + "/server/rest/allfilms/" + accountId);
        Film[] films = null;
        try {
            httpClient.executeMethod(getMethod);
            try {
                String body = getMethod.getResponseBodyAsString();
                films = new Gson().fromJson(body, Film[].class);
            } catch (JsonParseException e) {
                e.printStackTrace();
                films = new Film[]{};
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return films;
    }

    public String sendWatched(Long accountId, String filmId) {
        HttpClient httpClient = new HttpClient();
        PostMethod postMethod = new PostMethod(Const.SERVER_ADDR + "/server/rest/setviewedweb");


        postMethod.addParameter(new NameValuePair("userId", String.valueOf(accountId)));
        postMethod.addParameter(new NameValuePair("filmId",filmId));
//        postMethod.addParameter(new NameValuePair("password", password));

        try {
            httpClient.executeMethod(postMethod);
            return postMethod.getResponseBodyAsString();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "null";
    }

//    public PaymentModel[] getRange(Long accountId, String filter) {
//        Calendar calendar = Calendar.getInstance();
//
//        Date first = new Date();
//        Date last = new Date();
//
//        switch (filter) {
//            case "yesterday":
//                calendar.setTime(new Date());
//
//                calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH) - 1);
//                calendar.set(Calendar.HOUR_OF_DAY, 0);
//                calendar.set(Calendar.MINUTE, 0);
//                calendar.set(Calendar.SECOND, 0);
//
//                first = calendar.getTime();
//
//                calendar.set(Calendar.HOUR_OF_DAY, 23);
//                calendar.set(Calendar.MINUTE, 59);
//                calendar.set(Calendar.SECOND, 59);
//
//                last = calendar.getTime();
//                break;
//            case "today":
//                calendar.setTime(new Date());
//
//                calendar.set(Calendar.HOUR_OF_DAY, 0);
//                calendar.set(Calendar.MINUTE, 0);
//                calendar.set(Calendar.SECOND, 0);
//
//                first = calendar.getTime();
//
//                calendar.set(Calendar.HOUR_OF_DAY, 23);
//                calendar.set(Calendar.MINUTE, 59);
//                calendar.set(Calendar.SECOND, 59);
//
//                last = calendar.getTime();
//                break;
//            case "week":
//                calendar.setTime(new Date());
//                last = calendar.getTime();
//                calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH) - 6);
//                first = calendar.getTime();
//                break;
//            case "month":
//                calendar.setTime(new Date());
//                last = calendar.getTime();
//                calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1);
//                first = calendar.getTime();
//                break;
//            case "all_time":
//                first = new Date(0);
//                last = new Date();
//                break;
//        }
//
//        HttpClient httpClient = new HttpClient();
//        GetMethod getMethod = new GetMethod(Const.URI_PAYMENT_ACCOUNTS + accountId + "/payments" + "?first=" + first.getTime() + "&last=" + last.getTime());
//        PaymentModel[] payments = null;
//        try {
//            httpClient.executeMethod(getMethod);
//            try {
//                String body = getMethod.getResponseBodyAsString();
//                payments = new Gson().fromJson(body, PaymentModel[].class);
//            } catch (JsonParseException e) {
//                e.printStackTrace();
//                payments = new PaymentModel[]{};
//            }
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        return payments;
//    }

//    public boolean delete(String accountId, String id, String type) {
//        String uri = "";
//        switch (type) {
//            case "payment":
//                uri = Const.URI_PAYMENT_ACCOUNTS + accountId + "/payments/" + String.valueOf(id);
//                break;
//            case "favorite":
//                uri = Const.URI_PAYMENT_ACCOUNTS + accountId + "/favorites/" + String.valueOf(id);
//                break;
//        }
//        HttpClient httpClient = new HttpClient();
//        DeleteMethod deleteMethod = new DeleteMethod(uri);
//        try {
//            httpClient.executeMethod(deleteMethod);
//        } catch (IOException e) {
//            e.printStackTrace();
//            return false;
//        }
//        return true;
//    }
}
