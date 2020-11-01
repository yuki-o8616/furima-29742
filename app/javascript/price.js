
// 0 このファイルを読み込まれるようにする

// 1 イベントを起こす要素を取得

// ２　１で取得した要素に対してインプットイベント

// ３　インプット要素に入っている価格を取得

// ４　手数料と販売利益を変数で定義する

// ５　４で定義した物を挿入する

function price (){
  const priceInput  = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {

    //　金額計算　
    price = priceInput.value　//入力された値を取得する
    tax = price / 10; 　//入力された値から10％の手数料計算をする
    profit = price - tax;　//入力された値ー手数料＝利益となるような計算
    
    //　計算した手数料・利益を貼り付ける要素を取得する（document.getElementById）
    const Tax = document.getElementById("add-tax-price");
    Tax.textContent = tax

    const Profit = document.getElementById("profit")
    Profit.textContent = profit
    //　取得した要素に貼り付ける記述をする

  });
}

window.addEventListener('load', price);

