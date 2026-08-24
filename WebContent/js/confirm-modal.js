const modal = document.getElementById("confirm-modal");
const modalMessage = document.getElementById("modal-message");
const modalOk = document.getElementById("modal-ok");
const modalCancel = document.getElementById("modal-cancel");

// confirm-btn クラスの全ボタンに、確認モーダルを付ける
const confirmButtons = document.querySelectorAll(".confirm-btn");
confirmButtons.forEach(function(btn) {
	btn.addEventListener("click", function(e) {
		e.preventDefault();
		modalMessage.textContent = btn.dataset.message;
		modal.classList.add("show");
		modalOk.onclick = function() {
			const url = btn.getAttribute('data-url');
			if (url) {
				window.location.href = url;
			} else {
				const form = btn.closest('form');
				form.submit();
			}

		};
	});
});

// 成功画面処理
const successModal = document.getElementById("success-modal");
const OkBtn = document.getElementById("OkBtn");
if (OkBtn) {
	OkBtn.addEventListener("click", function() {
		successModal.classList.remove("show");
	});
}

// キャンセル
modalCancel.addEventListener("click", function() {
	modal.classList.remove("show");
});
