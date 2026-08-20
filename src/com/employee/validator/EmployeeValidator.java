package com.employee.validator;

import java.util.HashMap;
import java.util.Map;

public class EmployeeValidator {

    public Map<String, String> validate(String name, String ageStr,
            String department, String email, String password) {

        Map<String, String> errors = new HashMap<>();

        // 氏名チェック
        if (name == null || name.isEmpty()) {
            errors.put("nameError", "氏名を入力してください。");
        }

        // 年齢チェック
        if (ageStr == null || ageStr.isEmpty()) {
            errors.put("ageError", "年齢を入力してください。");
        } else {
            try {
                Integer.parseInt(ageStr);
            } catch (NumberFormatException e) {
                errors.put("ageError", "年齢は数字で入力してください。");
            }
        }

        // 部署チェック
        if (department == null || department.isEmpty()) {
            errors.put("departmentError", "部署を入力してください。");
        }

        // メールチェック
        if (email == null || email.isEmpty()) {
            errors.put("emailError", "メールを入力してください。");
        } else if (!email.contains("@")) {
            errors.put("emailError", "正しいメールアドレスを入力してください。");
        }

        // パスワードチェック（更新のときはnullが渡されるのでスキップ）
        if (password != null) {
            if (password.isEmpty()) {
                errors.put("passwordError", "パスワードを入力してください。");
            }
        }

        return errors;
    }
}