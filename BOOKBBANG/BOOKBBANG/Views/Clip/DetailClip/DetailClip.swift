import SwiftUI

struct DetailClip: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("뒤로가기 버튼 클릭됨")
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                Text("클립 상세정보")
                    .font(.system(size: 18))
                    .font(.headline)
                    .foregroundColor(Color("typo100"))
                
                Spacer()
                
                Button(action: {
                    print("수정하기 버튼 클릭됨")
                }) {
                    Text("수정")
                        .font(.system(size: 18))
                        .foregroundColor(.green)
                }
            }
            .padding()
            
            VStack {
                Image("WaterDropClip")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding(.bottom, 14)
                
                Text("행복한 나의 빵 먹기 생활")
                    .font(.system(size: 24))
                    .font(.headline)
                    .foregroundColor(Color("typo100"))
                
                Text("빵을 먹을 때의 꿀팁들과 맛있는 빵 먹는 묘사들")
                    .font(.system(size: 12))
                    .foregroundColor(Color("typo50"))
                    .padding(.bottom, 40)
            }
            
            HStack {
                Text("총 몇개")
                    .font(.system(size: 13))
                    .padding()
                Spacer()
            }
            .padding(.bottom, 13)
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("typo10"))
                    .frame(width: 389, height: 260)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.green, lineWidth: 1)
                    )
                
                VStack(alignment: .leading) {
                    Text("당신이 누군가를 죽였다")
                        .font(.system(size: 16))
                        .foregroundColor(Color("typo100"))
                        .padding(.bottom, 12)
                    
                    Text("그리고는, 안고 온 꽃묶음 속에서 가지가 꺾이고 꽃이 일그러진 송이를 골라 발 밑에 버린다. 소녀는 소년이 개울둑에 앉아 있는 걸 아는지 모르는지 그냥 날쌔게 물만 움켜 낸다.")
                        .font(.system(size: 15))
                        .foregroundColor(Color("typo100"))
                        .padding(.bottom, 14)
                    
                    HStack {
                        Text("2024년 7월 26일")
                            .font(.system(size: 12))
                            .foregroundColor(Color("typo50"))
                        
                        Spacer()
                        
                        Image("WaterDropClip")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("typo50"))
                    }
                    
                }
                .padding()
            }
            .padding()
            
            Spacer()
        }
    }
}

struct DetailClip_Previews: PreviewProvider {
    static var previews: some View {
        DetailClip()
    }
}

#Preview {
    DetailClip()
}
