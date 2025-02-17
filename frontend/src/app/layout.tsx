import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "@coreui/coreui-pro/dist/css/coreui.min.css";
import "./globals.css";
import AppSideBar from "@/app/components/appSidebar/appSideBar";
import { CContainer, CHeader } from "@coreui/react-pro";
import AppHeader from "./components/appHeader/appHeader";
import AppBreadcrumb from "./components/appBreadcrumb/appBreadcrumb";

export const metadata: Metadata = {
  title: "FreedomIT Gerenciador",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html>
      <body className="d-flex flex-row">
        <AppSideBar />
        <div className="d-flex flex-column min-vh-100 w-100">
          <AppHeader/>
          <div className="body flex-grow-1" style={{width: "100%"}}>
            <AppBreadcrumb/>
            <CContainer lg>
              {children}
            </CContainer>
          </div>
        </div>
      </body>
    </html>
  );
}
