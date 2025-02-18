"use client"
import Image from "next/image";
import styles from "./page.module.css";
import { CButton, CCol, CRow } from "@coreui/react-pro";
import SalesCard from "./components/cards/salesCard/SalesCard";

export default function Home() {
  return (
    <CRow>
      <CCol xl={4}>
        <CRow>
          <CCol xl={12}>
            <SalesCard/>
          </CCol>
        </CRow>
      </CCol>
    </CRow>
  );
}
