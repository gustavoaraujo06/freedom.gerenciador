import { CContainer, CHeader } from "@coreui/react-pro";
import styles from "./appHeader.module.scss";

export default function AppHeader() {
  return (
    <CHeader position="sticky" className={styles.header + " p-0"}>
      <CContainer fluid className="d-flex justify-content-between w-100">
        teste
      </CContainer>
    </CHeader>
  );
}
