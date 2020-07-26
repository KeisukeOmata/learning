import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    //引数にcoordinateを取る
    //緯度と経度の入れ物
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        //地図の拡大状態の設定
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        //緯度、経度と地図の拡大状態を渡す
        let region = MKCoordinateRegion(center: coordinate, span: span)
        //regionをuiViewに渡す
        uiView.setRegion(region, animated: true)
    }
}

//プレビュー画面
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        //引数coordinateにjsonの1つ目の緯度と経度を渡す
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
