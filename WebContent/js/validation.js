		const submitButton = document.getElementById("submit-btn");

		//氏名エラーチェック
		const nameInput = document.getElementById("name");
		const nameError = document.getElementById("name-error");

		nameInput.addEventListener("input", function() {
			if (nameInput.value.length > 20) {
				//20文字超えたら
				nameError.textContent = "20文字以内で入力してください";
				nameInput.style.borderColor = "red";
			} else {
				nameError.textContent = "";
				nameInput.style.borderColor = "";
			}
			updateButton();
		});

		//年齢チェック
		const ageInput = document.getElementById("age");
		const ageError = document.getElementById("age-error");

		ageInput.addEventListener("input", function() {
			if (ageInput.value.length > 2) {
				//2桁超えたら
				ageError.textContent = "正しい年齢を入力してください";
				ageInput.style.borderColor = "red";
			} else {
				ageError.textContent = "";
				ageInput.style.borderColor = "";
			}
			updateButton();
		});

		//部署チェック
		const departmentInput = document.getElementById("department");
		const departmentError = document.getElementById("department-error");

		departmentInput.addEventListener("input", function() {
			if (departmentInput.value.length > 15) {
				//15文字超えたら
				departmentError.textContent = "15文字以内で入力してください";
				departmentInput.style.borderColor = "red";
			} else {
				departmentError.textContent = "";
				departmentInput.style.borderColor = "";
			}
			updateButton();
		});

		//登録ボタン無効
		function updateButton() {
		    // 3つの欄が、それぞれ制限を超えているか
		    const nameOver = nameInput.value.length > 20;
		    const ageOver = ageInput.value.length > 2;
		    const deptOver = departmentInput.value.length > 15;

		    // どれか1つでも超えていたら、ボタンを無効にする
		    if (nameOver || ageOver || deptOver) {
		    	submitButton.disabled = true;
		    } else {
		    	submitButton.disabled = false;
		    }
		}