const submitButton = document.getElementById("submit-btn");

// 氏名エラーチェック
const nameInput = document.getElementById("name");
const nameError = document.getElementById("name-error");
if (nameInput) {
	nameInput.addEventListener("input", function() {
		if (nameInput.value.length > 20) {
			nameError.textContent = "20文字以内で入力してください";
			nameInput.style.borderColor = "red";
		} else {
			nameError.textContent = "";
			nameInput.style.borderColor = "";
		}
		updateButton();
	});
}

// 年齢チェック
const ageInput = document.getElementById("age");
const ageError = document.getElementById("age-error");
if (ageInput) {
	ageInput.addEventListener("input", function() {
		if (ageInput.value.length > 2) {
			ageError.textContent = "正しい年齢を入力してください";
			ageInput.style.borderColor = "red";
		} else {
			ageError.textContent = "";
			ageInput.style.borderColor = "";
		}
		updateButton();
	});
}

// 部署チェック
const departmentInput = document.getElementById("department");
const departmentError = document.getElementById("department-error");
if (departmentInput) {
	departmentInput.addEventListener("input", function() {
		if (departmentInput.value.length > 15) {
			departmentError.textContent = "15文字以内で入力してください";
			departmentInput.style.borderColor = "red";
		} else {
			departmentError.textContent = "";
			departmentInput.style.borderColor = "";
		}
		updateButton();
	});
}

// パスワード強度チェック（新しいパスワード欄）
const newpasswordInput = document.getElementById("newpassword");
const newpasswordError = document.getElementById("newpassword-error");
if (newpasswordInput) {
	newpasswordInput.addEventListener("input", function() {
		if (isPasswordStrong(newpasswordInput.value)) {
			newpasswordError.textContent = "";
			newpasswordInput.style.borderColor = "";
		} else {
			newpasswordError.textContent = "12文字以上で、大文字・小文字・数字をすべて含めてください";
			newpasswordInput.style.borderColor = "red";
		}
		updateButton();
	});
}

// パスワード強度の判定（4条件をすべて満たせば true）
function isPasswordStrong(value) {
	const hasLength = value.length >= 12;   // 12文字以上
	const hasUpper  = /[A-Z]/.test(value);  // 大文字を含む
	const hasLower  = /[a-z]/.test(value);  // 小文字を含む
	const hasNumber = /[0-9]/.test(value);  // 数字を含む
	return hasLength && hasUpper && hasLower && hasNumber;
}

// ボタン無効の判定
function updateButton() {
	const nameOver = nameInput && nameInput.value.length > 20;
	const ageOver = ageInput && ageInput.value.length > 2;
	const deptOver = departmentInput && departmentInput.value.length > 15;
	// 新しいパスワードが強度不足なら true
	const passwordWeak = newpasswordInput && !isPasswordStrong(newpasswordInput.value);

	if (nameOver || ageOver || deptOver || passwordWeak) {
		submitButton.disabled = true;
	} else {
		submitButton.disabled = false;
	}
}